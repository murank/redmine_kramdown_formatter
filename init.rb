# Redmine Kramdown formatter
#
# Copyright (C) 2016 murank
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

require 'redmine/wiki_formatting/kramdown/formatter'
require 'kramdown/converter/html_patch'

Redmine::Plugin.register :redmine_kramdown_formatter do
  name 'Kramdown Wiki formatter'
  author 'murank'
  description 'Markdown wiki formatting by kramdown'
  version '1.0.0'
  url 'https://github.com/murank/redmine_kramdown_formatter'

  wiki_format_provider 'kramdown',
    Redmine::WikiFormatting::Kramdown::Formatter,
    Redmine::WikiFormatting::Markdown::Helper,
    Redmine::WikiFormatting::Markdown::HtmlParser

end
