require 'asciidoctor/doctest/base_example'
require 'asciidoctor/doctest/html/normalizer'
require 'htmlbeautifier'
require 'nokogiri'

module Asciidoctor::DocTest
  module HTML
    ##
    # Subclass of {BaseExample} for HTML-based backends.
    class Example < BaseExample

      def content_normalized
        Nokogiri::HTML.fragment(content).normalize!.to_s
      end

      def content_pretty
        HtmlBeautifier.beautify content_normalized
      end
    end
  end
end
