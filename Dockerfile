FROM ffb01683ed4d

USER 0

RUN \
  dnf install -y --setopt=install_weak_deps=False \
  vagrant rubygem-{formatador,excon,builder,ruby-libvirt,nokogiri,multi_json} && \
  vagrant plugin install vagrant-libvirt && \
  vagrant plugin install vagrant-managed-servers && \
  vagrant plugin install vagrant-rsync-back && \
  dnf install -y tmt-all && \
  dnf clean all

USER 1001
