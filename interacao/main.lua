-- Esconder barra de tarefas
display.setStatusBar( display.HiddenStatusBar );

 -- Dimenções da Tela
_w = display.viewableContentWidth;
_h = display.viewableContentHeight;

-- local blueBall = display.newCircle(_w/3, _h/2, 30);
-- blueBall:setFillColor(0, 0, 0.7);

local yellowBall = display.newCircle(_w/2, _h/2, 30);
yellowBall:setFillColor(1, 0.8, 0);



local function tapBall( ev )
	local alvo = ev.target; -- Pega o objeto que recebeu o evento (o tap)
	alvo.y = alvo.y + 10;
	print(ev.name, ev.x, ev.y);
end


local function touchBall( ev )
	local alvo = ev.target;

	if (ev.phase == "began") then -- inicio
		
	elseif (ev.phase == "moved") then -- movimento

		if ((ev.x <= yellowBall.width/2)or (ev.x >=280 )or(ev.y <= 30)or (ev.y >=480)) then
			alvo.x = ev.x +ev.x  ;
			alvo.y = ev.y ;
		else 
			alvo.x =  ev.x;
			alvo.y =  ev.y;
		end

		
		
		
	elseif (ev.phase == "ended") then -- final
		alvo.x = ev.x;
		alvo.y = ev.y;
	end
	print(ev.name, ev.x, ev.y);
end


-- Atribuir o evento aos objetos
-- blueBall:addEventListener("evento", nomeDaFuncao);
-- blueBall:addEventListener("tap", tapBall);

yellowBall:addEventListener("touch", touchBall);

