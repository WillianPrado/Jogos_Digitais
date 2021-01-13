local _w = display.contentWidth;
local _h = display.contentHeight;


local papel = display.newGroup();
local folha = display.newRect(papel, _w/2, _h/2, _w, _h-80);

local ferramenta = "circulo";

local xInicial, yInicial;

local rect;
local circ;

local function desenhaRetangulo(ev)
	
	if ( ev.phase == "began" ) then
		xInicial = ev.xStart;
		yInicial = ev.yStart;
	elseif ( ev.phase == "moved" ) then
		local x = ev.x;
		local y = ev.y;

		-- Apagando retângulo existente
		if ( rect ~= nil ) then
			display.remove(rect);
		end

		rect = display.newRect(papel, xInicial, yInicial, x-xInicial, y-yInicial);
		rect:setStrokeColor(1, 0, 0);
		rect.strokeWidth = 4;

		-- Ajustando a posição
		rect.x = rect.x + (rect.width/2);
		rect.y = rect.y + (rect.height/2);


	elseif ( ev.phase == "ended" ) then
		-- Apagando retângulo existente
		if ( rect ~= nil ) then
			display.remove(rect);
		end

		local x = ev.x;
		local y = ev.y;

		local rectFinal = display.newRect(papel, xInicial, yInicial, x-xInicial, y-yInicial);
		rectFinal:setStrokeColor(1, 0, 0);
		rectFinal.strokeWidth = 4;

		-- Ajustando a posição
		rectFinal.x = rectFinal.x + (rectFinal.width/2);
		rectFinal.y = rectFinal.y + (rectFinal.height/2);

	end

end


local function desenhaCirculo(ev)
	
	if ( ev.phase == "began" ) then
		xInicial = ev.xStart;
		yInicial = ev.yStart;
	elseif ( ev.phase == "moved" ) then
		local x = ev.x;
		local y = ev.y;

		-- Apagando retângulo existente
		if ( circ ~= nil ) then
			display.remove(circ);
		end

		local raio;
		if ( x-xInicial > y-yInicial ) then
			raio = x-xInicial;
		else
			raio = y-yInicial;
		end

		circ = display.newCircle(papel, xInicial, yInicial, raio/2);
		circ:setStrokeColor(1, 0, 0);
		circ.strokeWidth = 4;

		-- Ajustando a posição
		circ.x = circ.x + (circ.width/2);
		circ.y = circ.y + (circ.height/2);


	elseif ( ev.phase == "ended" ) then
		local x = ev.x;
		local y = ev.y;

		-- Apagando retângulo existente
		if ( circ ~= nil ) then
			display.remove(circ);
		end

		local raio;
		if ( x-xInicial > y-yInicial ) then
			raio = x-xInicial;
		else
			raio = y-yInicial;
		end

		local circFinal = display.newCircle(papel, xInicial, yInicial, raio/2);
		circFinal:setStrokeColor(1, 0, 0);
		circFinal.strokeWidth = 4;

		-- Ajustando a posição
		circFinal.x = circFinal.x + (circFinal.width/2);
		circFinal.y = circFinal.y + (circFinal.height/2);

	end

end



local function touchPapel(ev)
	if ( ferramenta == "retangulo" ) then
		desenhaRetangulo(ev);
	elseif ( ferramenta == "circulo" ) then
		desenhaCirculo(ev);
	end
	
end


papel:addEventListener("touch", touchPapel);