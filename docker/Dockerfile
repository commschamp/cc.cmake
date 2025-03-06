# Stage 1: Build
FROM debian:bookworm AS builder

ARG CONFIG=config/All.cmake
ARG HAS_GUI_APPS=true
ARG HAS_BOOST_APPS=true
ARG HAS_CODE_GENERATORS=true

# Install dependencies
RUN apt update && apt install -y cmake g++ git
RUN if [ "${HAS_GUI_APPS}" = "true" ]; then apt install -y make qtbase5-dev libqt5serialport5-dev; fi
RUN if [ "${HAS_BOOST_APPS}" = "true" ]; then apt install -y libssl-dev libboost-all-dev; fi
RUN if [ "${HAS_CODE_GENERATORS}" = "true" ]; then apt install -y libxml2-dev; fi

# Set working directory
WORKDIR /cc

# Copy source code
COPY . .

WORKDIR /cc/build

# Build the target
RUN cmake .. -DCMAKE_INSTALL_PREFIX=install -DCMAKE_BUILD_TYPE=Release -DCMAKE_PROJECT_INCLUDE=${CONFIG}

RUN cmake --build /cc/build --parallel $(nproc) 

RUN rm -rf /cc/build/install/include /cc/build/install/bin/*.sh /cc/build/install/lib/*.a

# Stage 2: Runtime
FROM debian:bookworm

ARG USERNAME=cc
ARG UID=1000
ARG HAS_GUI_APPS=true
ARG HAS_BOOST_APPS=true
ARG HAS_CODE_GENERATORS=true

# Install packages
RUN apt update 
RUN if [ "${HAS_GUI_APPS}" = "true" ]; then apt install -y libqt5gui5 libqt5widgets5 libqt5serialport5 qt5dxcb-plugin; fi
RUN if [ "${HAS_BOOST_APPS}" = "true" ]; then apt install -y libssl3 libboost-program-options1.74.0 libboost-system1.74.0; fi
RUN if [ "${HAS_CODE_GENERATORS}" = "true" ]; then apt install -y libxml2; fi

# Copy compiled binary from builder stage
COPY --from=builder /cc/build/install /cc
COPY --from=builder /cc/docker/cc.sh /

ENV LD_LIBRARY_PATH=/cc/lib
ENV USERNAME=${USERNAME}
ENV UID=${UID}

RUN if [ "${USERNAME}" != "root" ]; then useradd -m -s /bin/bash -u ${UID} ${USERNAME}; fi

USER ${USERNAME}

ENTRYPOINT ["/cc.sh"]

WORKDIR /home/${USERNAME}
