# encoding: utf-8
require 'redmine'

# send patches
#require_dependency 'project_patch'

Redmine::Plugin.register :redmine_password_tool do
  name 'Redmine Passwort Verwaltung'
  author 'Christian Simon'
  description 'Integriert eine Passwort Verwaltung ins Redmine'
  version '0.0.1'
  url 'http://www.former03.de'

  settings  :partial => 'redmine_password_tool',
            :default => {
              # Secret zum Ver-/Entschlüsseln von Passwortdaten
              'pt_secret' => 'YahTha4wee2Eidoh',
            }

  # Menüeintrag bei Projekten
  menu :project_menu, :password_instances, { :controller => 'password_instances', :action => 'index' }, :caption => 'Passwörter',  :after => :wiki, :param => :id

  project_module :password_instances do
    permission :pt_read,   :password_instances => :index
    permission :pt_modify, :password_instances => :set
  end
  
  
  
  
end



