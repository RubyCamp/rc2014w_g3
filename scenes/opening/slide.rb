require "pp"

module Opening
	class Slide
		attr_reader :second
		attr_accessor :key, :to
		
		def initialize second, key = K_SPACE, to = nil, &block
			@second = second
			@key = key
			@to = to
			@block = block
			@once_block = Proc.new
			@@dispose_targets = []
		end
		
		def action
			@block.call
		end
		
		def set_once_action &block
			@once_block = block
			puts "HOHGOEHOGHEOHHGOOE:\n #{@once_block}"
		end
		
		def once_action
			@once_block.call
		end
		
		def add_dispose_target obj_name
		  @@dispose_targets << obj
		end
		
		def dispose
			puts "DISPOSE!"
			@@dispose_targets.each do |target|
				target.dispose
			end
		end
		
	end
end