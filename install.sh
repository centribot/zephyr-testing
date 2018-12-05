export ZSDK_VERSION=0.9.5
export GCC_ARM_NAME=gcc-arm-none-eabi-7-2018-q2-update

sudo apt-get install --no-install-recommends -y \
	autoconf \
	automake \
	build-essential \
	ccache \
	cmake \
	device-tree-compiler \
	doxygen \
	gcc-multilib \
	gperf \
	make \
	ninja-build \
	wget

sudo pip3 install -r scripts/requirements.txt
sudo pip3 install wheel west sh

sudo apt-get --no-install-recommends -y remove python3.4
sudo apt-get --no-install-recommends -y autoremove

if [ ! -d "/home/semaphore/zephyr-sdk-0.9.5" ]; then
wget -q "https://github.com/zephyrproject-rtos/meta-zephyr-sdk/releases/download/${ZSDK_VERSION}/zephyr-sdk-${ZSDK_VERSION}-setup.run" && \
  sh "zephyr-sdk-${ZSDK_VERSION}-setup.run" --quiet -- -d $HOME/zephyr-sdk-${ZSDK_VERSION} && \
  rm "zephyr-sdk-${ZSDK_VERSION}-setup.run"

fi
