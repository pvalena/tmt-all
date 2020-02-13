FROM fedora:30

RUN \
  dnf install -y --setopt=install_weak_deps=False \
  vagrant rubygem-{formatador,excon,builder,ruby-libvirt,nokogiri,multi_json}

RUN vagrant plugin install vagrant-libvirt && \
  vagrant plugin install vagrant-managed-servers && \
  vagrant plugin install vagrant-rsync-back

RUN dnf install -y tmt-all
