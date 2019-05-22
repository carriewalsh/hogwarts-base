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
    service["name"]
  end


  private

    def service
      @_service ||= SearchService.new(@house).jsonificus
    end

    def accio_students
      service["students"]
    end

end
