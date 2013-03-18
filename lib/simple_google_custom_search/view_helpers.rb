module SimpleGoogleCustomSearch
  module ViewHelpers
    def sgcs_paginate(result_set)
      pagination = ''
      current_page_num = params[:page_num].present? ? params[:page_num].to_i : 1
      unless current_page_num <= 1
        pagination += content_tag(:li ,(link_to 'Prev', request.path + '?search_term='+ result_set.query + '&page_num=' + (current_page_num - 1).to_s))
      end

      (1..result_set.total_pages).each do |i|
        pagination += content_tag(:li, (link_to i, request.path + '?search_term='+ result_set.query + '&page_num=' + i.to_s)) 
      end

      unless current_page_num >= result_set.total_pages
        pagination += content_tag(:li, link_to('Next', request.path + '?search_term='+ result_set.query + '&page_num=' + (current_page_num + 1).to_s))
      end

      content_tag(:ul, pagination.html_safe)
      
    end
  end
end