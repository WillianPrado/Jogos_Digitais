

-- Comentário Simples -- 
--[[

	Comentários de multiplas linhas
	multiplas linhas

]]--

--[[aa
bb--]] -- ctrl + shift + ;


-- VÁRIAVEIS
-- Tipos: number, string, boolean, table, function, nil

-- declaração de váriavel

local x = 10; -- local define que existe apenas neste arquivo
local y = 20;
local vico = true;
local nome = "João";
local sobrenome = "Silva";

print(x .. " " .. y); -- concatenação

-- OPERADORES
-- MATEMÁTICOS: + - * /
-- COMPARAÇÃO: >, <, >=, <=, ==, ~= (diferente)
-- LÓGICOS: and, or, not

-- Operadores Lógicos
-- or retorna o primeiro operando que não seja nil ou false
-- and, por sua vez, retorna seu primeiro argumento se ele é falso e o segundo argumento caso contrário

print( false or 23 );
print( 23 and false );
print( not true );


-- EXTRUTURAS CONDICIONAIS
-- Uma expressão será considerada falsa caso seja igual a nil ou false
-- Será verdadeira caso contrário (inclusive quando ela for 0)


-- IF
local idade = 90;
if ( idade < 16) then
	print("Não pode votar!");
elseif ( idade < 18 ) then
	print("Voto Facultativo");
elseif ( idade >= 18 and idade <= 65 ) then
	print("Voto obrigatório");
else
	print("Voto facultativo")
end


-- Estruturas de Repetição

-- While
local i = 0;
while ( i < 10 ) do
	print( i );
	i = i + 1;
end


-- FOR
print("#### FOR ####");
for i = 0, 10, 2 do
	print(i);
end

-- FOR INERTIDO
print("#### FOR INVERTIDO ####");
for i = 10, 0, -1 do
	print(i);
end

-- TABELAS

print("##### TABELAS #####");

local t = {"Johnny", 4, true};
print(t[1]); -- Indices iniciam em 1

local pos = {x = 100, y = 200, "Warrior"};
print( pos["x"], pos.y );

print( #t, #pos ); -- Tamanho da tabela

local tartarugas = {
	"Donatelo",
	"Rafael",
	"Michelangelo",
	"Leonardo",
	mestre = "Splinter"
};

-- pega somente indices numéricos
print("##### IPAIRS #####");
for chave, valor in ipairs(tartarugas) do
	print(chave, valor);
end

-- pega indices numéricos e associativos
print("##### PAIRS #####");
for chave, valor in pairs(tartarugas) do
	print(chave, valor);
end

-- FUNÇÕES
print("##### FUNÇÔES #####");
local function somar(a, b)
	a = a or 0;
	b = b or 0;
	return a + b;
end

local resultado = somar(10);
print( resultado );

local function operacoes( a, b )
	return a + b, a - b, a * b, a / b;
end

local soma, sub, mult, div = operacoes(20, 5);
print(soma, sub, mult, div);

local mais = (operacoes(20,5));
print(mais);