module StageModule
		def show_title(font_exist,title)
			titlefont = Font.new(50,"HGS行書体")
			if font_exist > 180
				Window.drawFont( 20, 20, title,titlefont,alpha:100,z:5 )
			elsif font_exist > 150
				Window.drawFont( 20, 20, title,titlefont,alpha:180,z:5 )
			elsif font_exist > 50
				Window.drawFont( 20, 20, title,titlefont,alpha:255,z:5 )
			elsif font_exist > 20
				Window.drawFont( 20, 20, title,titlefont,alpha:180,z:5 )
			elsif font_exist > 0
				Window.drawFont( 20, 20, title,titlefont,alpha:100,z:5 )
			end
		end
		def collision_action(player,item)
			if player === item
				$got_items << (item.name)
				item.vanish
				$item_timer = 60
				$item_name = item.detail
			end
		end
end
