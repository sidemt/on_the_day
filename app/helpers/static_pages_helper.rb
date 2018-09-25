module StaticPagesHelper
  
  def dot_color(day_num, dot_num)
    if day_num >= dot_num
      return 'dot-done'
    else
      return ''
    end
  end
end
