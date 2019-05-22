class SearchFacade

  def student_count
    accio_students.count
  end

  def students
    accio_students
  end


  private

    def service
      SearchService.new()
    end

    def accio_students

    end

end
