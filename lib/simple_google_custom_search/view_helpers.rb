module SimpleGoogleCustomSearch
  SEARCH_NUMBER_OF_PAGES = 10 unless defined?(SEARCH_NUMBER_OF_PAGES)
  SEARCH_PAGE_OFFSET = 5 unless defined?(SEARCH_PAGE_OFFSET)

  module ViewHelpers
    def sgcs_paginate(result_set)



      pagination = ''
      current_page_num = params[:page_num].present? ? params[:page_num].to_i : 1
      # Only show previous if not on page 1
      if current_page_num > 1
        pagination += link_to 'Prev', request.path + '?search_term='+ result_set.query + '&page_num=' + (current_page_num - 1).to_s
        # ellipsis when there are more pages to show before
        if current_page_num > (SEARCH_PAGE_OFFSET + 1)
          pagination += content_tag(:span,'...')
        end
      end

      total_pages = result_set.total_pages

      # More than 10 results (i.e. more than 1 page)
      if total_pages > SEARCH_NUMBER_OF_PAGES
        # If current page num is 7 or more (pagination pages start at 2)
        if current_page_num > (SEARCH_PAGE_OFFSET + 1)
          start_page = current_page_num - SEARCH_PAGE_OFFSET
          # If there are lots more pages
          if (current_page_num + (SEARCH_PAGE_OFFSET - 1) <= total_pages )
            end_page = current_page_num + (SEARCH_PAGE_OFFSET - 1) 
            pagination += make_page_link(current_page_num, start_page, end_page)
          # We're nearing the end of the pages list
          else
            end_page = total_pages 
            pagination += make_page_link(current_page_num, start_page, end_page)    
          end
        # We're still in the range where we can see page 1 (current page < 7)
        else
            pagination += make_page_link(current_page_num, 1, SEARCH_NUMBER_OF_PAGES)
        end
      # 10 or less results (1 page)
      else
        pagination += make_page_link(current_page_num, 1, total_pages)
      end
      
      #Show elipsis if there are more pages to be seen 
      if current_page_num < total_pages
        if total_pages > SEARCH_NUMBER_OF_PAGES
          pagination += content_tag(:span,'...')
        end
        pagination += link_to "Next &rarr;".html_safe, search_page_path( search_term: params[:search_term], page_num: current_page_num + 1)
      end

      content_tag('div', pagination.html_safe)
    end

    def make_page_link(current_page_num, start_page, end_page)
      pagination = ''
      (start_page..end_page).each do |page_num|
        pagination += link_to page_num, search_page_path( search_term: params[:search_term], page_num: page_num ), :class=> (page_num == current_page_num ? "current &rarr;" : "")

      end
      pagination
    end
  end
end