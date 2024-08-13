require 'yaml'
require 'pry'

def papers_from_yaml
  YAML.load_file('papers.yaml')
end

def papers
  papers_list = papers_from_yaml

  papers_body = ''
  papers_list.each do |pp|
    papers_body += "#{paper_title(pp)}\n"
  end
  papers_body
end

def paper_title(data)
  "1. #{data['title']}. [#{data['author']} (#{data['year']})](#{data['link']})"
end

def readme(papers_string)
  readme_temp = File.read('README.md.template')
  body_pattern = '{{ PAPERS }}'

  readme_temp.gsub!(body_pattern) do |_match|
    papers_string
  end

  File.write('README.md', readme_temp)
end

def main
  papers_str = papers
  readme(papers_str)
end

main
