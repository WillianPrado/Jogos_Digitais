-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- Your code here
-- Esconder barra de tarefas
display.setStatusBar( display.HiddenStatusBar );

 -- Dimenções da Tela
_w = display.viewableContentWidth;
_h = display.viewableContentHeight;

local papel = display.newGroup();
local folha = display.newRect(papel, _w/2, _h/2, _w, _h);


-- Funcção Cria Casa do Tabuleiro
local function criaCasa( px, py, lar, alt, claro )
	local casa = display.newRect(px, py, lar, alt);

	if ( claro == true  ) then
		casa:setFillColor( 0, 1, 1); -- Branco
	else
		casa:setFillColor( 1, 0, 0); -- Vermelho
	end
end

local numCol = 8;
local numLin = 12;
local tam = _w / numCol;
local claro = true;
-- cria linha
for lin = 1, numLin do
	-- cria coluna
	for col = 1, numCol do
		local px = col * tam - (tam / 2);
		local py = (lin * tam) - (tam / 2);
		criaCasa(px, py, tam, tam, claro);
		claro = not claro;
		
	end
	claro = not claro; -- troca cor de cada linha
end
local w = (8 * (_w/8)-(_w/16));
local h = (12 * (_h/12))-(_h/24);
local ball = display.newCircle( w ,h , 15);

local function touchPapel(ev)
	local alvo = ev.target;
	


	if ( ev.phase == "ended" ) then
		
		
		
		local x = ev.x ;
		local y = ev.y;
		
		local largura = x ;
		local altura  = y ;
		--ball.x =  largura;
		--ball.y =  altura;
		function posicao( ev)
			local cont = 0;
			for i = 0, 9, 1 do	
				cont = cont + 1;					
			    if(x < ((cont * (_w/8)-(_w/16)))) then			
					largura = (cont * (_w/8)-(_w/16));
					cont = 0;
					break
				end	--fim if

			end-- fim for

			--for y
			for i = 0, 12,1 do	
				cont = cont + 1;					
			    if(y < ((cont * (_h/12))-(_h/24))) then			
					altura =  ((cont * (_h/12))-(_h/24))+10;
					cont = 0;
					break
				end	--fim if
			end--Fim for y
			
			--ball.x = ball.x - 10;
			if(ball.y >= altura)then


			ball.y = ball.y - 10;
			else
				ball.x = ball.x - 20;
				--ball.y = ball.y + 10;
				if(ball.x <= largura) then
					Runtime:removeEventListener( "enterFrame", posicao );


				end	--fim if
			end	--fim if
					
		end-- fim função posicao
		Runtime:addEventListener("enterFrame", posicao);	

	end

end



papel:addEventListener("touch", touchPapel);