-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
-- Esconder barra de tarefas
display.setStatusBar( display.HiddenStatusBar );


 -- Dimenções da Tela
_w = display.viewableContentWidth;
_h = display.viewableContentHeight;

-- local linha = display.newLine(10, 10, 100, 150);
-- local linha2 = display.newLine(10, 150, 100, 10);
-- linha2.stroKeWidth = 5; --Espessura da Linha
-- linha2:setStrokeColor(1, 0, 0); -- cor da Linha

-- ############### Retangulos ##############
-- newRect(xIni, yIni, Largura, Altura)
-- A Posição de inicio será o centro dele
-- Possui as propriedades: x, y, width, height
local rect1 = display.newRect(_w/2, _h/2, 100, 100);
rect1.strokeWidth = 3;
rect1:setStrokeColor(1, 0, 0);
rect1:setFillColor(1, 1, 0);

-- rect1.x = 265;
-- rect1.y = 425;
--rect1.width = 100;
rect1.x = _w - rect1.width/2;
rect1.y = _h - rect1.height/2;

local rect2 = display.newRect(_w/2, _h/2, 100, 100);
rect2.strokeWidth = 3;
rect2:setStrokeColor(1, 0, 0);
-- rect2:setFillColor(1, 1, 0);
rect2.x = rect2.width/2;
rect2.y = _h - rect2.height/2;
--rect2.rotation = 45;

-- ############ Cículos ###############
-- newCircle(cIni, yIni, Raio)
local circ = display.newCircle(_w/2, _h/2, 30);
circ:setFillColor(0, 0.7, 0);
--Posição
circ.y = _h - circ.height/2;

-- ############# Bandeira do Brasil ##############
--Retangulo Maior
local retanguloMaior = display.newRect(_w/2, _h/2, _w, 220);
retanguloMaior:setFillColor(0, 0.7, 0);
-- Posição
retanguloMaior.y = retanguloMaior.height/2;

local losango = display.newRect(_w/2, _h/2, 150, 150);
-- rotação
losango.rotation = 45;
losango:setFillColor(255, 255, 0);
--Posição
losango.y = retanguloMaior.height/2;

local circulo = display.newCircle(_w/2, _h/2, 60);
circulo:setFillColor(0, 0.5, 1);
--Posição
circulo.y = losango.height/2 + 35;

local retanguloMenor = display.newRect(_w/2, _h/2, 120, 20);
retanguloMaior:setFillColor(0, 0.7, 0);
--rotação
retanguloMenor.rotation = 340;
-- Posição
retanguloMenor.y = retanguloMaior.height/2;
