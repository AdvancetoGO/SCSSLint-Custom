require 'spec_helper'

describe SCSSLint::Linter::LineLength do
  context 'when a rule is empty' do
    let(:scss) do
      <<-SCSS
        p{
        }
      SCSS
    end

    it 'does not report' do
      expect(subject).not_to(report_lint)
    end
  end

  context 'when line is within limits' do
    let(:scss) do
      <<-SCSS
        div{
          background: white;
        }
      SCSS
    end

    it 'does not report' do
      expect(subject).not_to(report_lint)
    end
  end

  context 'when line is too long' do
    let(:scss) do
      <<-SCSS
        div{
          background-image: url('http://image-cdn.image-cdn-host.com/cat-riding-fire-breathing-unicorn.jpg');
        }
      SCSS
    end

    it 'reports the line which is too long' do
      expect(subject).to report_lint(line: 2)
    end
  end
end
