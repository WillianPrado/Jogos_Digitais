display.setStatusBar( display.HiddenStatusBar )

local _w = display.contentWidth;
local _h = display.contentHeight;

local ball = display.newCircle(_w/2,_h/2, 20);
-- funções para direcionar ball
local function downLeft(ev)
	ball.x = ball.x - 11;
	ball.y = ball.y + 20;
	if(ball.y > _h + (ball.width/2))then
		ball.x =  _w/2;
		ball.y =  _h/2;
	end

end	

local function downRight(ev)
	ball.x = ball.x + 11;
	ball.y = ball.y + 20;
	if(ball.y > _h + (ball.width/2))then
		ball.x =  _w/2;
		ball.y =  _h/2;
	end
end	

local function upRight(ev)
	ball.x = ball.x + 11;
	ball.y = ball.y - 20;

	if(ball.y < 0 )then
		Runtime:removeEventListener( "enterFrame", upRight );
	end
end	

local function upLeft(ev)
	ball.x = ball.x - 10,5;
	ball.y = ball.y - 20;
	if(ball.y < 0 - (ball.width/2))then
		ball.x =  _w/2;
		ball.y =  _h/2;
	end
end	
-- funções para direcionar ball

local xInicial, yInicial; 


local function touchBall( ev )
	local alvo = ev.target;

	if (ev.phase == "began") then -- inicio
		
	elseif (ev.phase == "moved") then -- movimento

				
			alvo.x =  ev.x;
			alvo.y =  ev.y;
	
	elseif (ev.phase == "ended") then -- final
		--inserindeo
		alvo.x =  _w/2;
		alvo.y =  _h/2;
		--chamando a função dependo do lugar onde a ball para
		if((ev.x <= _w/2)and (ev.y <= _h/2))then
			
			Runtime:addEventListener("enterFrame", upLeft);
		end 
		if((ev.x >= _w/2)and (ev.y <= _h/2))then
			
			Runtime:addEventListener("enterFrame", upRight);
		end 
		if((ev.x >= _w/2)and (ev.y >= _h/2))then
			
			Runtime:addEventListener("enterFrame", downRight);
		end 
		if((ev.x <= _w/2)and (ev.y >= _h/2))then
			
			Runtime:addEventListener("enterFrame", downLeft);
		end 
		--fim chamar função
		
	end
	print(ev.name, ev.x, ev.y);
end


ball:addEventListener("touch", touchBall);


