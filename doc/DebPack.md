# Ubuntu/Debian Packages Support

The pre-built x86_64 deb packages can be downloaded from the relevant [release artefacts](https://github.com/commschamp/cc.cmake/releases).
They are named `cc-debs-<distro>_<version>.tar.gz`.

There is also APT repository for all these packages available. It is hosted by the [cc.ppa](https://github.com/commschamp/cc.ppa) project and
serviced via github pages. Please read the [instructions](https://github.com/commschamp/cc.ppa) on how to use it.

## Prepare Build Environment

In order to be able to build it locally the proper development environment needs to be set up.

1. Install all the necessary packages:
```
sudo apt install \
    build-essential \
    devscripts \
    debhelper \
    dpkg-dev \
    sbuild \
    schroot \
    debootstrap \
    ubuntu-keyring \
    ca-certificates \
    eatmydata \
    aptly \
    gnupg
```

2. Add your user to "sbuild" environment
```
sudo sbuild-adduser "$USER"
```

3. Add your user to "sbuild" group. Re-login or even reboot might be required.
```
sudo usermod -a -G sbuild ${USER}
```

4. Choose distros to support and create sbuild environment for them
```
DISTROS=(noble resolute)
CHROOT_LOCATION="/srv/chroot"

mkdir -p ${CHROOT_LOCATION}
for d in "${DISTROS[@]}"; do
    echo "Creating $d chroot..."
    sudo sbuild-createchroot \
        --include=eatmydata \
        --components=main,universe \
        --extra-repository="deb http://archive.ubuntu.com/ubuntu ${d}-updates main universe" \
        --extra-repository="deb http://security.ubuntu.com/ubuntu ${d}-security main universe" \
        "$d" \
        "${CHROOT_LOCATION}/${d}-amd64" \
        http://archive.ubuntu.com/ubuntu
done
```

## How to Build

Use [script/deb_build.sh](../script/deb_build.sh) script to build all the packages. Check the script code to see the
available configuration parameters. Use the following environment variables to modify the default behaviour:

- **PROJ_INCLUDE_NAME** - Select the project configuration
- **JOBS** - Number of build threads
- **DISTROS** - Colon separated list of sbuild environments for which packages need to be created.

Also note that the packages version is determined by the recent git tag relative to the current HEAD.
The package maintainer is listed as the person that created that tag's commit.

```
DISTROS="noble:resolute" ./script/deb_build.sh
```

The expected output is multiple `cc-debs-<distro>_<version>.tar.gz` archives inside `build.deb` directory depending on amount of distros used during build process.

## How to Deploy

Use [script/deb_publish.sh](../script/deb_publish.sh) script to prepare the required structure for APT repository servicing.
Check the script code to see the available configuration parameters.
Use the following environment variables to modify the default behaviour:

- **GPG_KEY_ID** - Provide ID of the local GPG private key for signing.
- **ASC_SIGN_NAME** - Name of the public key file to be exported to the APT repository infrastructure.
- **DISTROS** - Colon separated list of sbuild environments for which packages have been created.

Note, that successful execution of the [script/deb_build.sh](../script/deb_build.sh) as a pre-requisite for successful deployment.

```
GPG_KEY_ID=0102030405060708090A0B0C0D0E0F1011121314 ASC_SIGN_NAME=mykey DISTROS="noble:resolute" ./script/deb_publish.sh
```
The expected output is inside `build.deb/publish` directory, which can be copied to the right place to be serviced via HTTPS.
