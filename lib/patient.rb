class Patient
  attr_reader :name
  attr_accessor :doctor, :date
  @@all = []
  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def new_appointment(doctor,date)
    appt = Appointment.new(date, self, doctor)
    appt
  end

  def appointments
    Appointment.all.select do
      |appointment| appointment.patient == self
    end
  end

  def doctors
    appointments.map do
      |appointment| appointment.doctor
    end
  end
end
