require 'spec_helper'

describe 'gdash' do
  let(:title) { 'gdash' }

  ['Debian', 'RedHat'].each do |osfamily|
    describe "gdash class without any parameters on #{osfamily}" do 
      let(:params) {{ }}
      let(:facts) { { :osfamily => osfamily } }

      it { should create_class('gdash') }
      it { should create_package('gdash') }
      it { should create_file('/etc/gdash.conf') }
      it {
        should create_file('/etc/gdash.conf')\
        .with_content(/^server pool.gdash.org$/)
      }
      if osfamily == 'RedHat' 
        it { should create_service('gdashd') }
      else
        it { should create_service('gdash') }
      end
    end
  end
end
