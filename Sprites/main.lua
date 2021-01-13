display.setStatusBar( display.HiddenStatusBar );

_w = display.viewableContentWidth;
_h = display.viewableContentHeight;

local fisica = require("physics");
--fisica.setDrawMode("hybrid");
fisica.setDrawMode("hybrid");
fisica.start();

fisica.setGravity(0, 100);
-- Criando Background
local fundo = display.newGroup();

local bg1 = display.newImageRect( "images/Backgrounds/colored_desert.png", _w, _h);
bg1.x = _w/2;
bg1.y = _h/2;



fundo:insert( bg1 );



local chao = display.newImageRect("images/Other/grass.png", _w, 35);
chao.x = _w / 2;
chao.y = _h - 17.5;
fisica.addBody(chao, "static");
-- Personagem utilizando Sprite
local opcoesSprite = {
	width = 94,			-- Largura do frame
	height = 64,		-- Altura do frame
	numFrames = 110		-- Numero de frames
};

local sheet = graphics.newImageSheet("images/sheet_M.png", opcoesSprite);



local seq = { -- Sequências
	{
		name = "paradoDir",			-- Nome da sequência
		start = 91,					-- Quadro inicial
		count = 1,					-- Quantidade de quadros
		time = 700,					-- Duração da animação de 1 loop
		loopCount = 0,				-- Quantidade de loops (0 é inifinito)
		loopDirection = "forward"	-- Direção da animação (forward)
	},
	{
		name = "paradoEsq",			-- Nome da sequência
		start = 99,					-- Quadro inicial
		count = 1,					-- Quantidade de quadros
		time = 700,					-- Duração da animação de 1 loop
		loopCount = 0,				-- Quantidade de loops (0 é inifinito)
		loopDirection = "forward"	-- Direção da animação (forward)
	},
	{
		name = "correrDir",			-- Nome da sequência
		start = 65,					-- Quadro inicial
		count = 8,					-- Quantidade de quadros
		time = 700,					-- Duração da animação de 1 loop
		loopCount = 0,				-- Quantidade de loops (0 é inifinito)
		loopDirection = "forward"	-- Direção da animação (forward)
	},
	{
		name = "correrEsq",			-- Nome da sequência
		start = 73,					-- Quadro inicial
		count = 8,					-- Quantidade de quadros
		time = 700,					-- Duração da animação de 1 loop
		loopCount = 0,				-- Quantidade de loops (0 é inifinito)
		loopDirection = "forward"	-- Direção da animação (forward)
	},

	{
		name = "socoDir",			-- Nome da sequência
		start = 1,					-- Quadro inicial
		count = 6,					-- Quantidade de quadros
		time = 700,					-- Duração da animação de 1 loop
		loopCount = 1,				-- Quantidade de loops (0 é inifinito)
		loopDirection = "forward"	-- Direção da animação (forward)
	},
	{
		name = "socoEsq",			-- Nome da sequência
		start = 7,					-- Quadro inicial
		count = 6,					-- Quantidade de quadros
		time = 700,					-- Duração da animação de 1 loop
		loopCount = 1,				-- Quantidade de loops (0 é inifinito)
		loopDirection = "forward"	-- Direção da animação (forward)
	},


	{
		name = "facadaDir",			-- Nome da sequência
		start = 83,					-- Quadro inicial
		count = 4,					-- Quantidade de quadros
		time = 1000,					-- Duração da animação de 1 loop
		loopCount = 1,				-- Quantidade de loops (0 é inifinito)
		loopDirection = "forward"	-- Direção da animação (forward)
	},
	{
		name = "facadaEsq",			-- Nome da sequência
		start = 87,					-- Quadro inicial
		count = 4,					-- Quantidade de quadros
		time = 1000,					-- Duração da animação de 1 loop
		loopCount = 1,				-- Quantidade de loops (0 é inifinito)
		loopDirection = "forward"	-- Direção da animação (forward)
	},
	{
		name = "tiroPistolaDir",			-- Nome da sequência
		start = 29,					-- Quadro inicial
		count = 2,					-- Quantidade de quadros
		time = 1000,					-- Duração da animação de 1 loop
		loopCount = 0,				-- Quantidade de loops (0 é inifinito)
		loopDirection = "forward"	-- Direção da animação (forward)
	},
	{
		name = "tiroPistolaEsq",			-- Nome da sequência
		start = 31,					-- Quadro inicial
		count = 2,					-- Quantidade de quadros
		time = 1000,					-- Duração da animação de 1 loop
		loopCount = 0,				-- Quantidade de loops (0 é inifinito)
		loopDirection = "forward"	-- Direção da animação (forward)
	},
	{
		name = "tiroMetralhaDir",			-- Nome da sequência
		start = 21,					-- Quadro inicial
		count = 2,					-- Quantidade de quadros
		time = 700,					-- Duração da animação de 1 loop
		loopCount = 0,				-- Quantidade de loops (0 é inifinito)
		loopDirection = "forward"	-- Direção da animação (forward)
	},
	{
		name = "tiroMetralhaEsq",			-- Nome da sequência
		start = 23,					-- Quadro inicial
		count = 2,					-- Quantidade de quadros
		time = 700,					-- Duração da animação de 1 loop
		loopCount = 0,				-- Quantidade de loops (0 é inifinito)
		loopDirection = "forward"	-- Direção da animação (forward)
	},
	{
		name = "sentadoDir",			-- Nome da sequência
		start = 13,					-- Quadro inicial
		count = 1,					-- Quantidade de quadros
		time = 700,					-- Duração da animação de 1 loop
		loopCount = 0,				-- Quantidade de loops (0 é inifinito)
		loopDirection = "forward"	-- Direção da animação (forward)
	},
	{
		name = "sentadoEsq",			-- Nome da sequência
		start = 14,					-- Quadro inicial
		count = 1,					-- Quantidade de quadros
		time = 700,					-- Duração da animação de 1 loop
		loopCount = 0,				-- Quantidade de loops (0 é inifinito)
		loopDirection = "forward"	-- Direção da animação (forward)
	},
	{
		name = "pulaDir",			-- Nome da sequência
		start = 55,					-- Quadro inicial
		count = 1,					-- Quantidade de quadros
		time = 2000,					-- Duração da animação de 1 loop
		loopCount = 1,				-- Quantidade de loops (0 é inifinito)
		loopDirection = "forward"	-- Direção da animação (forward)
	},
	{
		name = "pulaEsq",			-- Nome da sequência
		start = 56,					-- Quadro inicial
		count = 1,					-- Quantidade de quadros
		time = 2000,					-- Duração da animação de 1 loop
		loopCount = 1,				-- Quantidade de loops (0 é inifinito)
		loopDirection = "forward"	-- Direção da animação (forward)
	},
}
local metal = display.newImageRect("images/Metal/elementMetal013.png",_w/4, 25);
metal.x = (_w/2 + metal.width/30)/1.9;
metal.y = _h -(_h/4)+7;
fisica.addBody(metal, "static");

local madeira = display.newImageRect("images/Wood/elementWood046.png", _w/3, 40);
madeira.x = (_w/2 + metal.width/30)/0.9;
madeira.y = _h -(_h/4)-38;
fisica.addBody(madeira, "static");

local ted = display.newSprite(sheet, seq);
ted.x = 30;
local alturanormal  = _h-(44+15)-10;
ted.y = alturanormal;--para o avatar volta a altura normal
ted:setSequence( "paradoDir" );
ted:setFrame( 1 );

local shapeTed = {-15,-30, 15,-30, 15,30, -15,30};
fisica.addBody(ted, "dynamic", {shape=shapeTed});
fisica.addBody(ted,{ density=0.3, friction=0.0, bounce=0.0 })
local lado = 1;
local esquerda = -1;
local direita  =  1;

local altura = 0;--fiz esse para o avatar pular
local direc  = 0;
local veloc  = 5;

local function vigiaEnterFrame(ev)
	-- Movendo personagem
	if ( direc ~= 0 ) then
		ted.x = ted.x + (veloc * direc);
	
	end	
end
Runtime:addEventListener("enterFrame", vigiaEnterFrame);


-- images dos botoes
local controle = display.newImageRect( "images/flatLight/flatLight02.png", _w/5, _w/5);

controle.x = _w/6;
controle.y = _h/5;

local controleY = display.newImageRect( "images/flatDark/flatDark38.png", _w/13, _w/13);

controleY.x = _w - _w/18;
controleY.y = _h/15;

local controleB = display.newImageRect( "images/flatDark/flatDark36.png", _w/13, _w/13);

controleB.x = _w + _w/33;
controleB.y = _h/5;

local controleA = display.newImageRect( "images/flatDark/flatDark35.png", _w/13, _w/13);

controleA.x = _w - _w/18;
controleA.y = _h/3;

local controleX = display.newImageRect( "images/flatDark/flatDark37.png", _w/13, _w/13);

controleX.x = _w - _w/7;
controleX.y = _h/5;

local setaDir = display.newImageRect( "images/flatDark/flatDark05.png", _w/13, _w/13);

setaDir.x = controle.x + (controle.x/2.9 );
setaDir.y = controle.y + (controle.y/1000);

local setaEsq = display.newImageRect( "images/flatDark/flatDark04.png", _w/13, _w/13);

setaEsq.x = controle.x - (controle.x/2.9 );
setaEsq.y = controle.y + (controle.y/1000);

local setaCima = display.newImageRect( "images/flatDark/flatDark02.png", _w/13, _w/13);

setaCima.x = controle.x;
setaCima.y = controle.y/1.9 ;

local setaBaixo = display.newImageRect( "images/flatDark/flatDark09.png", _w/13, _w/13);

setaBaixo.x = controle.x;
setaBaixo.y = controle.y +(controle.y/2.2) ;
--Fim images dos botoes

-- funçoes dos botoes
local function soco(ev)
	if ( ev.phase == "began" ) then
		if(lado == direita) then
			ted:setSequence("socoDir");
			ted:setFrame(1);
		else
			ted:setSequence("socoEsq");
			ted:setFrame(1);
		end	
		
	elseif ( ev.phase == "ended" ) then
		if ( lado == direita ) then
			ted:setSequence("paradoDir");
			ted:setFrame(1);
		else
			ted:setSequence("paradoEsq");
			ted:setFrame(1);
		end

		direc = 0;
	end
	ted:play();
end
local function facada(ev)
	if ( ev.phase == "began" ) then
		if(lado == direita) then
			ted:setSequence("facadaDir");
			ted:setFrame(1);
		else
			ted:setSequence("facadaEsq");
			ted:setFrame(1);
		end	
		
	elseif ( ev.phase == "ended" ) then
		if ( lado == direita ) then
			ted:setSequence("paradoDir");
			ted:setFrame(1);
		else
			ted:setSequence("paradoEsq");
			ted:setFrame(1);
		end

		direc = 0;
	end
	ted:play();
end

local function tiroPistola(ev)
	if ( ev.phase == "began" ) then
		if(lado == direita) then
			ted:setSequence("tiroPistolaDir");
			ted:setFrame(1);
		else
			ted:setSequence("tiroPistolaEsq");
			ted:setFrame(1);
		end	
		
	elseif ( ev.phase == "ended" ) then
		if ( lado == direita ) then
			ted:setSequence("paradoDir");
			ted:setFrame(1);
		else
			ted:setSequence("paradoEsq");
			ted:setFrame(1);
		end

		direc = 0;
	end

	ted:play();
end

local function tiroMetralha(ev)
	if ( ev.phase == "began" ) then
		if(lado == direita) then
			ted:setSequence("tiroMetralhaDir");
			ted:setFrame(1);
		else
			ted:setSequence("tiroMetralhaEsq");
			ted:setFrame(1);
		end	
		
	elseif ( ev.phase == "ended" ) then
		if ( lado == direita ) then
			ted:setSequence("paradoDir");
			ted:setFrame(1);
		else
			ted:setSequence("paradoEsq");
			ted:setFrame(1);
		end

		direc = 0;
	end
	ted:play();
end

local function setaDireita(ev)
	if ( ev.phase == "began" ) then
		direc = 1;
		ted:setSequence("correrDir");
		ted:setFrame(1);
	elseif ( ev.phase == "ended" ) then
		ted:setSequence("paradoDir");
		ted:setFrame(1);
		direc = 0;
		lado = direita;
	end

	ted:play();
end

local function setaEsquerda(ev)
	if ( ev.phase == "began" ) then
		direc = -1;
		ted:setSequence("correrEsq");
		ted:setFrame(1);
	elseif ( ev.phase == "ended" ) then
		ted:setSequence("paradoEsq");
		ted:setFrame(1);
		direc = 0;
		lado = esquerda;
	end

	ted:play();
end

local function sentado(ev)
	if ( ev.phase == "began" ) then
		if(lado == direita) then
			ted:setSequence("sentadoDir");
			ted:setFrame(1);
		else
			ted:setSequence("sentadoEsq");
			ted:setFrame(1);
		end	
		
	elseif ( ev.phase == "ended" ) then
		if ( lado == direita ) then
			ted:setSequence("sentadoDir");
			ted:setFrame(1);
			lado = direita;
		else
			ted:setSequence("sentadoEsq");
			ted:setFrame(1);
			lado = esquerda;
		end

		direc = 0;

	end
	ted:play();
end

local function pulo(ev)
	if ( ev.phase == "began" ) then
		if(lado == direita) then
			ted:setSequence("pulaDir");
			shapeTed = {-15,-30, 15,-30, 15,15, -15,15};
			ted:applyLinearImpulse(0.4,-1.15, ted.x, ted.y);
			fisica.addBody(ted, "dynamic", {shape=shapeTed});
			ted.linearDamping = 15;
			--ted.angularVelocity = -15
		else
			ted:setSequence("pulaEsq");
			ted:applyLinearImpulse(0,-10, ted.x, ted.y);
		end	
		
	elseif ( ev.phase == "ended" ) then
		if ( lado == direita ) then
			ted:setSequence("paradoDir");
			--ted:applyLinearImpulse(0,0, ted.x, ted.y);
			shapeTed = {-15,-30, 15,-30, 15,15, -15,15};
			--ted:applyLinearImpulse(0.4,-0.95, ted.x, ted.y);
			--ted.angularVelocity = 50
			lado = direita;
		else
			ted:setSequence("paradoEsq");
			ted:setFrame(1);
			--ted:applyLinearImpulse(0,0, ted.x, ted.y)
			lado = esquerda;
		end
		shapeTed = {-15,-30, 15,-30, 15,30, -15,30};
		fisica.addBody(ted, "dynamic", {shape=shapeTed});
		direc  = 0;
		altura = 0;
		--ted.y = alturanormal;

	end
	--ted.linearDamping = 0
	ted:play();
end



--Fim funçoes dos botoes
setaCima:addEventListener("touch", pulo);
setaBaixo:addEventListener("touch", sentado);
setaDir:addEventListener("touch", setaDireita);
setaEsq:addEventListener("touch", setaEsquerda);
controleB:addEventListener("touch", soco);
controleA:addEventListener("touch", facada);
controleY:addEventListener("touch", tiroPistola);
controleX:addEventListener("touch", tiroMetralha);

















