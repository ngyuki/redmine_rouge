# coding: utf-8

require 'redmine/syntax_highlighting'
require 'rouge'

module Redmine
  module SyntaxHighlighting
    module Rouge

      @@INLINE_LANGUAGE_MAP = {
        'phtml' => ::Rouge::Lexers::PHP,
        'html+php' => ::Rouge::Lexers::PHP,
        'php' => ::Rouge::Lexers::PHP.new(:start_inline => true),
      }

      class << self
        def highlight_by_filename(text, filename)
          lexer = ::Rouge::Lexer.guess_by_filename(filename)
          highlight(text, lexer, true)
        end

        def highlight_by_language(text, language)
          if @@INLINE_LANGUAGE_MAP.has_key?(language)
            lexer = @@INLINE_LANGUAGE_MAP[language]
          else
            lexer = ::Rouge::Lexer.find(language)
          end

          highlight(text, lexer, false)
        end

        def highlight(text, lexer, by_filename)
          text.force_encoding('utf-8')

          # delete BOM
          text.gsub!("\xEF\xBB\xBF", '')

          # delete last CRLF
          text.chomp!

          lexer ||= ::Rouge::Lexers::PlainText
          formatter = ::Rouge::Formatters::HTML.new(:line_numbers => false, :wrap => false)
          output = ::Rouge.highlight(text, lexer, formatter)
        end
      end
    end
  end

  SyntaxHighlighting.highlighter = 'Rouge'
end
