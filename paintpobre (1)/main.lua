-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

display.setStatusBar( display.HiddenStatusBar );

 -- Dimenções da Tela
_w = display.viewableContentWidth;
_h = display.viewableContentHeight;

--################# Grupos ###################
local grupoFerramentas = display.newGroup();
local grupoConfiguracoes = display.newGroup();
local grupoPapel = display.newGroup();

-- Fundo da Ferramentas
local headerFerramentas = display.newRect(grupoFerramentas, _w/2, _h/2, _w, 50);
headerFerramentas.y = headerFerramentas.height/2; -- Posição

headerFerramentas:setFillColor(3/255, 189/255, 3/255); -- Cor de Background

-- Icones
local lapis = display.newImageRect(grupoFerramentas, "icons/pencil.png", 40, 45);
lapis.x = _w/8; -- posição width
lapis.y = headerFerramentas.height/2; -- posição heigth


local linha = display.newImageRect(grupoFerramentas, "icons/line.png", 45, 45);
linha.x = _w/3.36; -- posição width
linha.y = headerFerramentas.height/2; -- posição heigth

local quadrado = display.newImageRect(grupoFerramentas, "icons/square.png", 45, 45);
quadrado.x = _w/2.1; -- posição width
quadrado.y = headerFerramentas.height/2; -- posição heigth

local circulo = display.newImageRect(grupoFerramentas, "icons/circle.png", 45, 45);
circulo.x = _w/1.5; -- posição width
circulo.y = headerFerramentas.height/2; -- posição heigth

local borracha = display.newImageRect(grupoFerramentas, "icons/eraser.png", 45, 45);
borracha.x = _w/1.16; -- posição width
borracha.y = headerFerramentas.height/2; -- posição heigth

local selecaoLapis = false; -- Variavel que verifica se foi selecionado ou não
local selecaoLinha = false;
local selecaoQuadrado = false;
local selecaoCirculo = false;
local selecaoBorracha = false;

-- ############## Interação das Ferramentas ##############
local function tapFerramenta( ev )
	local alvo = ev.target; -- Pega o objeto que recebeu o evento (o tap)

	if (alvo.x == lapis.x and alvo.y == lapis.y) then

		selecaoLapis = true;
		selecaoLinha = false;
		selecaoQuadrado = false;
		selecaoCirculo = false;
		selecaoBorracha = false;

		lapis.strokeWidth = 2; -- Define borda pro icone lápis
		linha.strokeWidth = 0;
		quadrado.strokeWidth = 0;
		circulo.strokeWidth = 0;
		borracha.strokeWidth = 0;

		return selecaoLapis;

	elseif (alvo.x == linha.x and alvo.y == linha.y) then

		selecaoLinha = true;
		selecaoLapis = false;
		selecaoQuadrado = false;
		selecaoCirculo = false;
		selecaoBorracha = false;

		linha.strokeWidth = 2; -- Define borda pro icone lápis
		lapis.strokeWidth = 0;
		quadrado.strokeWidth = 0;
		circulo.strokeWidth = 0;
		borracha.strokeWidth = 0;

		return selecaoLinha;

	elseif (alvo.x == quadrado.x and alvo.y == quadrado.y) then

		selecaoQuadrado = true;
		selecaoLapis = false;
		selecaoLinha = false;
		selecaoCirculo = false;
		selecaoBorracha = false;

		quadrado.strokeWidth = 2; -- Define borda pro icone lápis
		linha.strokeWidth = 0;
		lapis.strokeWidth = 0;
		circulo.strokeWidth = 0;
		borracha.strokeWidth = 0;

		return selecaoQuadrado;

	elseif (alvo.x == circulo.x and alvo.y == circulo.y) then

		selecaoCirculo = true;
		selecaoLapis = false;
		selecaoLinha = false;
		selecaoQuadrado = false;
		selecaoBorracha = false;

		circulo.strokeWidth = 2; -- Define borda pro icone lápis
		linha.strokeWidth = 0;
		lapis.strokeWidth = 0;
		quadrado.strokeWidth = 0;
		borracha.strokeWidth = 0;

		return selecaoCirculo;

	elseif (alvo.x == borracha.x and alvo.y == borracha.y) then

		selecaoBorracha = true;
		selecaoLapis = false;
		selecaoLinha = false;
		selecaoCirculo = false;
		selecaoQuadrado = false;

		borracha.strokeWidth = 2; -- Define borda pro icone lápis
		linha.strokeWidth = 0;
		lapis.strokeWidth = 0;
		quadrado.strokeWidth = 0;
		circulo.strokeWidth = 0;



		return selecaoBorracha;
	end

end

local ferramentaL = lapis:addEventListener("tap", tapFerramenta);
local ferramentaLi = linha:addEventListener("tap", tapFerramenta);
local ferramentaQ = quadrado:addEventListener("tap", tapFerramenta);
local ferramentaC = circulo:addEventListener("tap", tapFerramenta);
local ferramentaB = borracha:addEventListener("tap", tapFerramenta);

-- Fundo da Configurações
local footerConfiguracoes = display.newRect(grupoConfiguracoes, _w/2, _h/2, _w, 50);
footerConfiguracoes.y = _h - footerConfiguracoes.height/2; -- Posição

footerConfiguracoes:setFillColor(3/255, 189/255, 3/255);-- Cor de Background

-- Icones Espessura
local espessuraP = display.newImageRect(grupoConfiguracoes, "icons/sphereP.png", 20, 20);
espessuraP.x = _w/16; -- posição width
espessuraP.y = _h - footerConfiguracoes.height/2; -- posição heigth

local espessuraM = display.newImageRect(grupoConfiguracoes, "icons/sphereM.png", 30, 30);
espessuraM.x = _w/7; -- posição width
espessuraM.y = _h - footerConfiguracoes.height/2; -- posição heigth

local espessuraG = display.newImageRect(grupoConfiguracoes, "icons/sphereG.png", 40, 40);
espessuraG.x = _w/4; -- posição width
espessuraG.y = _h - footerConfiguracoes.height/2; -- posição heigth

-- Bolinhas de Cores
local bolinhaRed = display.newCircle(grupoConfiguracoes,_w/2, _h/2, 17);
bolinhaRed.x = _w/1.5; -- posição width
bolinhaRed.y = _h - footerConfiguracoes.height/2; -- posição heigth

bolinhaRed:setFillColor(254/255, 4/255, 1/255); -- Cor da Bolinha

local bolinhaBlue = display.newCircle(grupoConfiguracoes,_w/2, _h/2, 17);
bolinhaBlue.x = _w/1.27; -- posição width
bolinhaBlue.y = _h - footerConfiguracoes.height/2; -- posição heigth

bolinhaBlue:setFillColor(6/255, 4/255, 255/255); -- Cor da Bolinha

local bolinhaYellow = display.newCircle(grupoConfiguracoes,_w/2, _h/2, 17);
bolinhaYellow.x = _w/1.1; -- posição width
bolinhaYellow.y = _h - footerConfiguracoes.height/2; -- posição heigth

bolinhaYellow:setFillColor(249/255, 222/255, 61/255); -- Cor da Bolinha

-- Icone de Salvar
local salvar = display.newImageRect(grupoConfiguracoes, "icons/save.png", 45, 45);
salvar.x = _w/2.15; -- posição width
salvar.y = _h - footerConfiguracoes.height/2; -- posição heigth

-- ################ INTERAÇÃO DA ESPESSURA #############################

-- Espessura
selecaoExpessuraP = false;
selecaoExpessuraM = false;
selecaoExpessuraG = false;

function tapEspessura( ev )
	local alvo = ev.target;

	if (alvo.x == espessuraP.x and alvo.y == espessuraP.y) then
		print("Expessura P selecionada!");
		selecaoExpessuraP = true;
		selecaoExpessuraM = false;
		selecaoExpessuraG = false;
		-- selecaoLapis = true;
		-- selecaoLinha = false;
		-- selecaoQuadrado = false;
		-- selecaoCirculo = false;
		-- selecaoBorracha = false;

		espessuraP.strokeWidth = 2; -- Define borda pro icone lápis
		espessuraM.strokeWidth = 0;
		espessuraG.strokeWidth = 0;
		-- linha.strokeWidth = 0;
		-- quadrado.strokeWidth = 0;
		-- circulo.strokeWidth = 0;
		-- borracha.strokeWidth = 0;

		return selecaoExpessuraP;

	elseif(alvo.x == espessuraM.x and alvo.y == espessuraM.y) then

		print("Expessura M selecionada!");
		selecaoExpessuraM = true;
		selecaoExpessuraP = false;
		selecaoExpessuraG = false;

		espessuraM.strokeWidth = 2; -- Define borda pro icone lápis
		espessuraG.strokeWidth = 0;
		espessuraP.strokeWidth = 0;

		return selecaoExpessuraM;

	elseif(alvo.x == espessuraG.x and alvo.y == espessuraG.y) then
		print("Expessura G selecionada!");

		selecaoExpessuraG = true;
		selecaoExpessuraP = false;
		selecaoExpessuraM = false;


		espessuraG.strokeWidth = 2; -- Define borda pro icone lápis
		espessuraP.strokeWidth = 0;
		espessuraM.strokeWidth = 0;

		return selecaoExpessuraG;

	end

end

local configEspessuraP = espessuraP:addEventListener("tap", tapEspessura);
local configEspessuraM = espessuraM:addEventListener("tap", tapEspessura);
local configEspessuraG = espessuraG:addEventListener("tap", tapEspessura);



-- #################### INTERAÇÃO DAS CORES ###################
--  Cores
selecaoBolinhaRed = false;
selecaoBolinhaBlue = false;
selecaoBolinhaYellow = false;

function tapCores( ev )
	local alvo = ev.target;

	if (alvo.x == bolinhaRed.x and alvo.y == bolinhaRed.y) then
		print("Cor vermelha selecionada!");

		selecaoBolinhaRed = true;
		selecaoBolinhaBlue = false;
		selecaoBolinhaYellow = false;


		bolinhaRed.strokeWidth = 2; -- Define borda pro icone lápis
		bolinhaBlue.strokeWidth = 0;
		bolinhaYellow.strokeWidth = 0;

		return selecaoBolinhaRed;

	elseif(alvo.x == bolinhaBlue.x and alvo.y == bolinhaBlue.y) then
		print("Cor azul selecionada!");

		selecaoBolinhaBlue = true;
		selecaoBolinhaRed = false;
		selecaoBolinhaYellow = false;


		bolinhaBlue.strokeWidth = 2; -- Define borda pro icone lápis
		bolinhaRed.strokeWidth = 0;
		bolinhaYellow.strokeWidth = 0;

		return selecaoBolinhaBlue;

	elseif(alvo.x == bolinhaYellow.x and alvo.y == bolinhaYellow.y) then
		print("Cor azul selecionada!");

		selecaoBolinhaYellow = true;
		selecaoBolinhaRed = false;
		selecaoBolinhaBlue = false;


		bolinhaYellow.strokeWidth = 2; -- Define borda pro icone lápis
		bolinhaRed.strokeWidth = 0;
		bolinhaBlue.strokeWidth = 0;

		return selecaoBolinhaYellow;
	end

end

local configCorRed = bolinhaRed:addEventListener("tap", tapCores);
local configCorBlue = bolinhaBlue:addEventListener("tap", tapCores);
local configCorYellow = bolinhaYellow:addEventListener("tap", tapCores);


-- ################ INTERAÇÃO SALVAR #############################
function tapSalvar( ev )
	local alvo = ev.target;

	if (alvo.x == salvar.x and alvo.y == salvar.y) then

		display.save( grupoPapel, { filename="imgPaintPobre.png", baseDir=system.DocumentsDirectory, captureOffscreenArea = true } )
		print("Salvo com Sucesso!");

		native.showAlert( "Salvar Arquivo", "Arquivo Salvo com Sucesso");

	end
end

local configSalva = salvar:addEventListener("tap", tapSalvar);

-- Fundo do Papel
local bodyPapel = display.newRect(grupoPapel, _w/2, _h/2, 320, 380);

	

-- ########### 	CRIAÇÃO DAS FERRAMENTAS ############
local function touchPapel( ev )
		local t = ev.target;
		local phase = ev.phase;
	-- Expessura Padrão
		local espessura = 3;

		--  Cor padrão
		corR = 0;
		corG = 0;
		corB = 0;

		-- Tamanho Tela Papel Superior e Inferior
		local tamS; 
		local tamI;

		-- Define a espessura
		if(selecaoExpessuraP == true) then
			espessura = 1;
			
			 tamS = 51;
			 tamI = 429;

		elseif(selecaoExpessuraM == true) then
			espessura = 5;
			tamS = 55;
			tamI = 425;

		elseif(selecaoExpessuraG == true) then
			espessura = 10;
			tamS = 60;
			tamI = 420;
		else 
			tamS = 53;
			tamI = 427;
		end

		-- Define a Cor
		if(selecaoBolinhaRed == true) then
			corR = 255/255;
			corG = 0/255;
			corB = 0/255;


		elseif(selecaoBolinhaBlue == true) then
			corR = 0/255;
			corG = 0/255;
			corB = 255/255;

		elseif(selecaoBolinhaYellow == true) then
			corR = 255/255;
			corG = 255/255;
			corB = 0/255;
		end

		local maoLivre;
	-- Verfica se o Lápis foi selecionado,
	if(selecaoLapis == true) then
		-- Define em que lugar da tela ele pode desenhar com o lápis
		if (ev.x >= 0 and ev.x <= 318 and ev.y >= tamS and ev.y <= tamI) then
			print("Mão Livre!");
			-- Verifica se esta movendo
			if (ev.phase == "moved") then
				-- Cria a linha do lapis pra desenhar
				maoLivre = display.newRect(ev.x, ev.y, espessura, espessura); -- Mão livre com quadrado
				--local maoLivre = display.newCircle(grupoPapel, ev.x, ev.y, espessura); -- Mão livre com Circulos
				maoLivre:setFillColor(corR, corG, corB);
			end
		end
	end

	-- Verfica se a Linha foi selecionado,
	if (selecaoLinha == true) then

		-- Define em que lugar da tela ele pode desenhar com o lápis
		if (ev.x >= 0 and ev.x <= 318 and ev.y >= tamS and ev.y <= tamI) then
			if ("began" == phase) then
				
				t.isFocus = true;

				criaLinha = nil;

			elseif t.isFocus then

				if ("moved" == phase) then
					display.remove( criaLinha );

					criaLinha = nil

					if (ev.yStart >= 50 and ev.yStart <= 430) then
						criaLinha = display.newLine(ev.xStart, ev.yStart, ev.x, ev.y);
						criaLinha:setStrokeColor( corR, corG, corB );
						criaLinha.strokeWidth = espessura;
					end
					print(ev.xStart, ev.yStart, ev.x, ev.y)					
				end

			end
		end
	end

	if (selecaoQuadrado == true) then

		if (ev.x >= 0 and ev.x <= 318 and ev.y >= tamS and ev.y <= tamI) then
			if ("began" == phase) then
				
				t.isFocus = true;

				criaQuadrado = nil;

			elseif t.isFocus then

				if ("moved" == phase) then
					display.remove( criaQuadrado );

					criaQuadrado = nil

					if (ev.yStart >= 50 and ev.yStart <= 430) then

						print(bodyPapel.height);

						criaQuadrado = display.newRect(ev.xStart, ev.yStart, ev.x, ev.y);
						
						criaQuadrado:setStrokeColor( corR, corG, corB );
						--criaQuadrado:setFillColor( 1, 0, 0 ) cor de preencimento
						criaQuadrado.strokeWidth = espessura;
						criaQuadrado.anchorX = 0;
						criaQuadrado.anchorY = 0;
						
					end
					print(ev.xStart, ev.yStart, ev.x, ev.y)					
				end
			end
		end
	end

	if (selecaoCirculo == true) then

		if (ev.x >= 0 and ev.x <= 318 and ev.y >= tamS and ev.y <= tamI) then
			if ("began" == phase) then
				
				t.isFocus = true;

				criaCirculo = nil;

			elseif t.isFocus then

				if ("moved" == phase) then
					display.remove( criaCirculo );

					criaCirculo = nil

					if (ev.yStart >= 50 and ev.yStart <= 430) then
						criaCirculo = display.newCircle(ev.xStart, ev.yStart, ev.x/3);
						criaCirculo:setStrokeColor( corR, corG, corB );
						criaCirculo.strokeWidth = espessura;
						--criaCirculo.path.radius = 50
						criaCirculo.anchorX = 0.2;
						criaCirculo.anchorY = 0.2;
						
					end
					print(ev.xStart, ev.yStart, ev.x, ev.y)					
				end
			end
		end
	end










	-- Verifica se a Borracha foi selecionada
	
	if(selecaoBorracha == true) then
		display.remove( grupoPapel );

		local grupoPapel = display.newGroup();
		grupoPapel:insert( bodyPapel);
	end






	print(ev.name, ev.x, ev.y);


end

bodyPapel:addEventListener("touch", touchPapel);
bodyPapel:addEventListener("touch", touchPapel);