echo "0. Update repo..."
sed -i '1iforce_color_prompt=yes' ~/.bashrc
sudo apt-get update
echo "---------------------------------------------------------------------------"

echo "1. Install Ubuntu packages..."
sudo apt-get install -y software-properties-common wget vim build-essential openssl libreadline6 libreadline6-dev libsqlite3-dev libmysqlclient-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libxml2-dev libxslt-dev autoconf automake cmake libtool imagemagick libmagickwand-dev libpcre3-dev language-pack-zh-hans libevent-dev libgmp-dev libgmp3-dev redis-tools nodejs htop
echo "---------------------------------------------------------------------------"

echo "2. Install RVM..."
command gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
command curl -L https://get.rvm.io | bash -s stable
if [ whoami = 'root']; then
command source /etc/profile.d/rvm.sh
else
command source ~/.rvm/scripts/rvm
fi
echo "---------------------------------------------------------------------------"


echo "3. Install Ruby..."
echo "ruby_url=https://cache.ruby-china.org/pub/ruby" > ~/.rvm/user/db
rvm requirements
rvm install 2.3.1 --disable-binary
rvm use 2.3.1 --default
rvm -v
ruby -v
echo "---------------------------------------------------------------------------"

echo "4. Install Rails..."
echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc
gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/
gem install bundler
bundle -v
gem install rails -v 4.2.7
rails -v
sudo apt-get clean
echo "--------------------------- Install Successed -----------------------------"
