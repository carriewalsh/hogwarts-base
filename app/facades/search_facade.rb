class SearchFacade

  def initialize(house)
    @house = house
  end

  def student_count
    students.count
  end

  def students
    accio_students
  end

  def house_name
    @house
  end


  private

    def service
      @_service ||= SearchService.new(@house).jsonificus_students
    end

    def accio_students
      service
    end

end
