module Nautilus
  class Worker
    def enqueue(job)
      self.status = 'enqueue'
      self.save
    end

    def success(job)
      self.status = 'success'
      self.save
    end

    def perform
      sleep 30
    end

    def before(job)
      self.status = "start"
      self.save
    end

    # def after(job)
    #   self.status = "after"
    #   self.save
    # end

    def error(job)
      self.media.status = "error"
      self.save
    end

    def failure
      # do something
    end
  end
end