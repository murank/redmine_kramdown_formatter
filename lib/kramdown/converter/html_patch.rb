# Redmine Kramdown formatter
#
# Copyright (C) 2016  murank
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

require 'cgi'

module Kramdown
  module Converter
    module HtmlPatch

      def self.included(base)
        base.send(:include, InstanceMethods)

        base.class_eval do
          alias_method_chain :convert_a, :redmine
          alias_method_chain :convert_codeblock, :redmine
          alias_method_chain :convert_codespan, :redmine
        end
      end

      module InstanceMethods

        def convert_a_with_redmine(el, indent)
          href = el.attr['href']
          unless href && href.starts_with?('/')
            el.attr['class'] = [el.attr['class'], 'external'].compact.join(' ')
          end

          convert_a_without_redmine(el, indent)
        end

        def convert_codeblock_with_redmine(el, indent)
          "#{' '*indent}<pre>#{convert_codespan_with_redmine(el, indent)}</pre>"
        end

        def convert_codespan_with_redmine(el, indent)
          lang = el.options[:lang]

          if lang.present?
            "<code class=\"#{CGI.escapeHTML(lang)} syntaxhl\">" +
              Redmine::SyntaxHighlighting.highlight_by_language(el.value, lang) +
              '</code>'
          else
            CGI.escapeHTML(el.value)
          end
        end
      end

    end

    Html.send(:include, HtmlPatch)
  end
end


