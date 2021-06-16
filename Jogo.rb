require 'gosu'
class Jogo < Gosu::Window
@@formato = [3, 1.0, 1.0, 0xffffffff]
def initialize 
    super(600,700,false)
    self.caption = "jogo corrida"
    @imagem_fundo = Gosu::Image.new(self, "Space.png", true)
	@imagem_car1 = Gosu::Image.new(self, "car1.png", true)
	@imagem_car2 = Gosu::Image.new(self, "car2.png", true)
	@imagem_car3 = Gosu::Image.new(self, "car3.png", true)
	@imagem_boom = Gosu::Image.new(self, "boom.png", true)
	@imagem_game_over = Gosu::Image.new(self, "GameOver.png", true)
	@fonte = Gosu::Font.new(self, Gosu::default_font_name, 20)
	@x_car1=260
	@y_car1=560
	@x_car2=150
	@y_car2=20
	@x_car3=362
	@y_car3=0
	@v=1
	@v2 =1
	@p=0
	@x_boom=0
	@y_boom=0
	@boom=0
	@pontos=0
	@msg=0
	end
	
	def draw
     @imagem_fundo.draw(0,0,1)
	 @imagem_boom.draw(@x_boom,@y_boom,@boom)
	 @imagem_game_over.draw(143,30,@boom)
	 @imagem_car1.draw(@x_car1,@y_car1,2)
	 @imagem_car2.draw(@x_car2,@y_car2,3)
	 @imagem_car3.draw(@x_car3,@y_car3,4)
	 @fonte.draw("Pontos : #{@pontos}", 10, 10, *@@formato)
	if (@msg==1)then
	msg = "VOCE FEZ #{@pontos} PONTOS"
    x = self.width / 2 - @fonte.text_width(msg,1) / 2
    @fonte.draw(msg, x, self.height/2, *@@formato)
	
	@fonte.draw("Tecle L Para Recomeçar ", 205, 400, *@@formato)
	
	
	end
	end
	def update
	 if (@p==0)then
	if button_down?(Gosu::Button::KbRight)then
	 @x_car1 += 5.0*@v2
	 if(@x_car1>375)then
	 @x_car1=375
	 end
    end	
	if button_down?(Gosu::Button::KbLeft) 
	 @x_car1 -= 5.0*@v2
	
	 if(@x_car1<140)then
	 @x_car1=140 
     end  
	end
	
	
	@y_car2 +=3*@v
	if(@y_car2>700)then
	@y_car2=0
	@x_car2+=100
	@pontos +=1
	if(@x_car2>375)
	@x_car2=155
	end
	end
	
	@y_car3 +=3*@v
	if(@y_car3>700)then
	@y_car3=0
    @x_car3+=100
	@pontos +=1
	if(@x_car3>360)
	 @x_car3=155
	
	end
	end
   @v +=0.002
   @v2 +=0.001
 end
   if Gosu::distance(@x_car1, @y_car1, @x_car2, @y_car2) < 60 then
     @p=1
	 @x_boom=@x_car2
	 @y_boom=@y_car2
	 @boom=5
	 @msg=1
	if button_down?(Gosu::Button::KbL)then
	 @p=0
	 @boom=0
	 @msg=0
	 @pontos=0
	 @v=1
	 @v2=1
	 @x_car1=260
	 @y_car1=560
	 @x_car2=150
	 @y_car2=20
	 @x_car3=362
	 @y_car3=0
	 end
	end
	if Gosu::distance(@x_car1, @y_car1, @x_car3, @y_car3) < 60 then
     @p=1
	 @x_boom=@x_car3
	 @y_boom=@y_car3
	 @boom=5
	 @msg=1
	 if button_down?(Gosu::Button::KbL)then
	 @p=0
	 @boom=0
	 @msg=0
	 @pontos=0
	 @v=1
	 @v2=1
	 @x_car1=260
	 @y_car1=560
	 @x_car2=150
	 @y_car2=20
	 @x_car3=362
	 @y_car3=0
	 end
	 
	end
	
	
end
end	
jogo = Jogo.new
jogo.show