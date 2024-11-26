CREATE DATABASE ProdutoFinal;
USE ProdutoFinal;

-- Isabela Orçati, Maria Fernanda, Maria Luiza, Mariana Gama, Marina Cristini 

-- Criação da tabela filme
CREATE TABLE Filme (
    cod_filme INT PRIMARY KEY,        -- cod único do filme, chave primária
    nome VARCHAR(45),                -- Nome do Filme
    dt_lancamento DATE,  -- Tipo de dado adequado para data 
    class_etaria VARCHAR(45) -- Classificação etária do filme
);

-- Criação da tabela Genero
CREATE TABLE Genero (
	idgenero INT PRIMARY KEY, -- cod único do Genero, chave primária
	nome VARCHAR(45) -- Nome do Genero do Filme assistido
);

-- Criação da tabela sessoes
CREATE TABLE Sessoes(
 id_sessao INT PRIMARY KEY, -- cod único da sessao , chave primária
    data_hora DATETIME NOT NULL, -- data e horário que vai começar a sessao
    cod_filme INT, -- código único do filme, chave estrangeira
    FOREIGN KEY (cod_filme) REFERENCES Filme (cod_filme) -- Chave estrangeira, que vem da tabela Filme
    );
    
-- Criação da tabela Sala
CREATE TABLE Sala (
    idsala INT PRIMARY KEY,        -- ID único da sala, chave primária
    capacidade INT,                -- Capacidade máxima de pessoas na sala
    n_sala INT                     -- Número identificador da sala
);

-- Criação da tabela Poltronas
CREATE TABLE Poltronas (
    idPoltronas INT PRIMARY KEY, -- Código único da Poltrona, chave primária
    numero INT NOT NULL, -- Número da Poltrona
    fileira CHAR(1) NOT NULL, -- Fileira onde está a Poltrona
    idsala INT, -- Id único da sala, chave estangeira
    tipo ENUM('Normal', 'VIP', 'Acessível') DEFAULT 'Normal', -- Tipo da Poltrona
    ocupada BOOLEAN DEFAULT FALSE, -- Se a Pltrona esta vaga ou não
    FOREIGN KEY (idsala) REFERENCES Sala(idsala) -- Chave estrangeira da tabela Sala
);

-- Criação da tabela Cliente
CREATE TABLE Cliente (
CPF VARCHAR(11) PRIMARY KEY, -- cod único do Cliente, chave primária
Nome VARCHAR(50), -- Nome do cliente
dt_nasc DATE -- Data de nascimento do Cliente
);

-- Inserção de valores nas tabelas
-- Inserção na tabela Filmes
INSERT INTO Filme (cod_filme, nome, dt_lancamento, class_etaria) VALUES
(1, 'O Rei Leão', '1994-06-15', 'Livre'), -- Código do filme = 1, Nome do filme = 'O Rei Leão', Data de Lançamento = 1994-06-15 e Classificação etaria = 'Livre'
(2, 'A Matrix', '1999-03-31', '14 anos'), -- Código do filme = 2, Nome do filme = 'A Matrix', Data de Lançamento = 1999-03-31 e Classificação etaria = '14 anos'
(3, 'O Exorcista', '1973-12-26', '18 anos' ), -- Código do filme = 3, Nome do filme = 'O Exorcista', Data de Lançamento = 1973-12-26 e Classificação etaria = '18 anos'
(4, 'Duro de Matar', '1988-07-15', '16 anos'),-- Código do filme = 4, Nome do filme = 'Duro de Matar', Data de Lançamento = 1988-07-15 e Classificação etaria = '16 anos'
(5, 'Se Beber, Não Case!', '2009-06-05', '14 anos');-- Código do filme = 5, Nome do filme = 'Se Beber, Não Case!', Data de Lançamento = 2009-06-05 e Classificação etaria = '14 anos'

-- Inserção na tabela Genero
INSERT INTO Genero (idgenero, nome) VALUES
(1, 'Infantil'), -- Código único do Genero = 1 e Nome do Genero = Infantil
(2, 'Ficção Cíentifica '), -- Código único do Genero = 2 e Nome do Genero = Ficção Cíentifica
(3, 'Terror'), -- Código único do Genero = 3 e Nome do Genero = Terror
(4, 'Ação'), -- Código único do Genero = 4 e Nome do Genero = Ação
(5, 'Comédia'); -- Código único do Genero = 5 e Nome do Genero = Comédia

-- Inserção na tabela sessoes
 INSERT INTO sessoes (id_sessao, data_hora, cod_filme) VALUES
(101, '2024-11-13 14:00:00', 1), -- Id único da sessão = 101, Data e hora da sessão = 2024-11-13 14:00:00 e código único do filme = 1
(102, '2024-11-13 16:30:00', 2), -- Id único da sessão = 102, Data e hora da sessão = 2024-11-13 16:30:00 e código único do filme = 2
(103, '2024-11-13 19:00:00', 3), -- Id único da sessão = 103, Data e hora da sessão = 2024-11-13 19:00:00 e código único do filme = 3
(104, '2024-11-13 21:30:00', 4),-- Id único da sessão = 104, Data e hora da sessão = 2024-11-13 21:30:00 e código único do filme = 4
(105, '2024-11-14 12:00:00', 5);-- Id único da sessão = 105, Data e hora da sessão = 2024-11-14 12:00:00 e código único do filme = 5

-- Inserção na tabela Sala
INSERT INTO Sala (idsala, capacidade, n_sala) VALUES
  (1, 30, 101),                 -- Sala 1: capacidade 50, número da sala 101
  (2, 50, 102),                -- Sala 2: capacidade 100, número da sala 102
  (3, 75, 103),                 -- Sala 3: capacidade 30, número da sala 103
  (4, 100, 104),                 -- Sala 4: capacidade 75, número da sala 104
  (5, 150, 105);                -- Sala 5: capacidade 150, número da sala 105
  
  -- Inserção na tabela Poltronas
  INSERT INTO Poltronas (idPoltronas , numero, fileira, idsala, tipo, ocupada) VALUES
(101, 1, 'A', 1, 'Normal', FALSE), -- Id único da Poltrona = 101, Numero da poltrona = 1, Fileira da Poltrona = 'A', Id único da sala = 1, Tipo da Poltrona = 'Normal' e se está ocupada = FALSE
(102, 2, 'A', 1, 'VIP', TRUE),  -- Id único da Poltrona = 102, Numero da poltrona = 2, Fileira da Poltrona = 'B', Id único da sala = 1, Tipo da Poltrona = 'VIP' e se está ocupada = TRUE
(103, 3, 'B', 2, 'Acessível', FALSE), -- Id único da Poltrona = 103, Numero da poltrona = 3, Fileira da Poltrona = 'C', Id único da sala = 1, Tipo da Poltrona = 'acessível' e se está ocupada = FALSE
(104, 4, 'C', 3, 'Normal', TRUE), -- Id único da Poltrona = 104, Numero da poltrona = 4, Fileira da Poltrona = 'D', Id único da sala = 1, Tipo da Poltrona = 'Normal' e se está ocupada = TRUE
(105, 5, 'D', 4, 'VIP', FALSE);  -- Id único da Poltrona = 105, Numero da poltrona = 5, Fileira da Poltrona = 'E', Id único da sala = 1, Tipo da Poltrona = 'VIP' e se está ocupada = FALSE
 
-- Inserção na tabela Cliente
INSERT INTO Cliente (CPF, Nome, dt_nasc) VALUES -- Inserção de valores na tabela Cliente
('03337246826', 'Isabela', '2002-08-13'), -- CPF do Clinte = '03337246826'  , Nome do Cliente = 'Isabela' e Data de Nascimento do cliente = '2002-08-13'
('19861462864', 'Maria Luiza', '2006-03-09'), -- CPF do Clinte = '19861462864' , Nome do Cliente = 'Maria Luiza' e Data de Nascimento do cliente = '2006-03-09'
('86807331800', 'Mariana', '2006-01-07'), -- CPF do Clinte = '86807331800' , Nome do Cliente = 'Mariana' e Data de Nascimento do cliente = '2006-01-07'
('97221101876', 'Marina', '2006-03-24'), -- CPF do Clinte = '97221101876' , Nome do Cliente = 'Marina' e Data de Nascimento do cliente = '2006-03-24'
('38515127822', 'Maria Fernanda', '2006-04-03'); -- CPF do Clinte = '38515127822' , Nome do Cliente = 'Maria Fernanda' e Data de Nascimento do cliente = '2006-04-03'

-- Alterações de registro nas tabelas
-- Alteração de registro  na tabela Filmes
UPDATE Filme
SET nome = 'O Rei Leão', class_etaria = 'Livre'
WHERE cod_filme = 1;

-- Alteração de registro na tabela Genero
UPDATE Genero
SET nome = 'Ficção Científica'
WHERE idgenero = 2;

-- Alteração de registro na tabela Sessoes
UPDATE Sessoes
SET data_hora = '2024-11-13 18:30:00'
WHERE id_sessao = 102;

-- Alteração de registro na tabela Sala
UPDATE Sala
SET capacidade = 40
WHERE idsala = 1;

-- Alteração de registro na tabela Poltronas
UPDATE Poltronas
SET tipo = 'VIP', ocupada = TRUE
WHERE numero = 2 AND fileira = 'A' AND idsala = 1;

 -- Alteração de registro na tabela Cliente
UPDATE Cliente
SET dt_nasc = '2005-03-15'
WHERE CPF = '03337246826';

-- Exclusão de registro nas tabelas
-- Exclusão de registro na tabela Filme
Alter TABLE  Filme DROP COLUMN class_etaria; -- Exclui a coluna class_etaria da tabela Filme

-- Exclusão de registro na tabela Genero
ALTER TABLE Genero DROP COLUMN nome; -- Excluindo a coluna nome da tabela Genero

-- Exclusão de registro na tabela sessoes
ALTER TABLE sessoes -- Alteração da estrutura da tabela sessoes, excluindo a coluna data_hora
 DROP COLUMN data_hora;
 
-- Exclusão de registro na tabela Sala
ALTER TABLE Sala DROP COLUMN n_sala; -- Exclui a couna n_sala da tabela Sala

-- Exclusão de registro na tabela Poltronas
DELETE FROM Poltronas
WHERE numero = 2 AND fileira = 'B' AND idsala = 3;

-- Exclusão de registro na tabela Cliente
DELETE FROM Cliente -- Exclui o CPF '03337246826' da tabela Cliente
WHERE CPF = '03337246826';

-- Alteração da estrutura das tabelas

-- Alteração de estrutua da tabela Filmes
ALTER TABLE Filme
ADD genero VARCHAR(45); -- Adiciona a coluna genero na tabela Filme

ALTER TABLE Filme
ADD class_etaria VARCHAR(45); -- Adiciona novamente a coluna class_etaria excluida anteriormente da tabela Filme

-- Alteração de estrutua da tabela Genero
ALTER TABLE Genero 
ADD COLUMN nome VARCHAR(45); -- Adiciona novamente a coluna nome, excluida anteriormente da tabela Genero

-- Alteração de estrutua da tabela sessoes
 ALTER TABLE sessoes
 ADD COLUMN data_hora DATETIME; -- Adiciona novamente a coluna data_hora, excluida anteriromente da tabela sessoes
 
 -- Alteração de estrutua da tabela Sala
 -- Alterando a tabela Sala para adicionar a coluna "tipo"
ALTER TABLE Sala
ADD COLUMN tipo VARCHAR(50);  -- Tipo da sala, como 'Pequena', 'Média' ou 'Grande'

ALTER TABLE Sala
ADD COLUMN n_sala INT; -- Adiciona novamente a coluna n_sala, excluida anteriormente da tabela Sala

-- Alteração de estrutua da tabela Poltronas
ALTER TABLE Poltronas ADD COLUMN ultima_limpa DATE; -- Adiciona a coluna ultima_limpa na tabela Poltronas

-- Alteração de estrutua da tabela Cliente
ALTER TABLE Cliente
ADD COLUMN email VARCHAR(100); -- Adiciona a coluna email na tabela Cliente
 
 INSERT INTO Cliente (CPF, Nome, dt_nasc) -- Inserção de registro na tabela Cliente
VALUES
('03337246826', 'Isabela', '2005-03-15');

UPDATE Cliente -- Insere o email de todos os clientes ja existentes na tabela Cliente
SET email = CASE
                WHEN CPF = '03337246826' THEN 'isabela@hotmail.com'
                WHEN CPF = '19861462864' THEN 'marialuiza@gmail.com'
                WHEN CPF = '86807331800' THEN 'mariana@outlook.com'
                WHEN CPF = '97221101876' THEN 'marina@gmail.com'
                WHEN CPF = '38515127822' THEN 'mariafernanda@gmail.com'
            END
WHERE CPF IN ('03337246826', '19861462864', '86807331800', '97221101876', '38515127822');

-- Conerverção de dados nas tabelas 

-- Conerverção de dados na tabela Filmes
UPDATE Filme SET genero = 'Ifantil' WHERE cod_filme = 1;
UPDATE Filme SET genero = 'Ficção Científica' WHERE cod_filme = 2;
UPDATE Filme SET genero = 'Terror' WHERE cod_filme = 3;
UPDATE Filme SET genero = 'Ação' WHERE cod_filme = 4;
UPDATE Filme SET genero = 'Comédia' WHERE cod_filme = 5;

UPDATE Filme SET class_etaria= 'livre' WHERE cod_filme = 1;
UPDATE Filme SET class_etaria= '14 anos' WHERE cod_filme = 2;
UPDATE Filme SET class_etaria= '18 anos' WHERE cod_filme = 3;
UPDATE Filme SET class_etaria= '16 anos' WHERE cod_filme = 4;
UPDATE Filme SET class_etaria= '14 anos' WHERE cod_filme = 5;

-- Conerverção de dados na tabela Genero
-- Atualizando a coluna "nome" com os nomes dos generos
UPDATE Genero SET nome = 'Infantil' WHERE idgenero = 1;
UPDATE Genero SET nome = 'Ficção Cíentifica' WHERE idgenero = 2;
UPDATE Genero SET nome = 'Terror' WHERE idgenero = 3;
UPDATE Genero SET nome = 'Ação' WHERE idgenero = 4;
UPDATE Genero SET nome = 'Comédia' WHERE idgenero = 5;

-- Conerverção de dados na tabela sessoes
 -- atualização da coluna "data_hora"  com as datas e horários das sessoes
 UPDATE sessoes SET data_hora='2024-11-13 14:00:00' WHERE id_sessao= 101;
 UPDATE sessoes SET data_hora='2024-11-13 16:00:00' WHERE id_sessao= 102;
 UPDATE sessoes SET data_hora='2024-11-13 19:00:00' WHERE id_sessao= 103;
 UPDATE sessoes SET data_hora='2024-11-13 21:30:00' WHERE id_sessao= 104;
 UPDATE sessoes SET data_hora='2024-11-14 12:00:00' WHERE id_sessao= 105;

-- Converção de dados na tabela Sala
-- Atualizando o tipo da sala de acordo com a capacidade
UPDATE Sala SET tipo = 'Pequena' WHERE idsala = 1;
UPDATE Sala SET tipo = 'Média' WHERE idsala = 2 && 3;
UPDATE Sala SET tipo = 'Grande' WHERE idsala = 4 && 5;

UPDATE Sala SET n_sala = 101 WHERE idsala = 1;
UPDATE Sala SET n_sala = 102 WHERE idsala = 2;
UPDATE Sala SET n_sala = 103 WHERE idsala = 3;
UPDATE Sala SET n_sala = 104 WHERE idsala = 4;
UPDATE sala SET n_sala = 105 WHERE idsala = 5;

 -- Converção de dados na tabela Poltronas
UPDATE Poltronas SET ultima_limpa = '2024-11-14' WHERE idPoltronas = 101;
UPDATE Poltronas SET ultima_limpa = '2024-11-15' WHERE idPoltronas = 102;
UPDATE Poltronas SET ultima_limpa = '2024-11-15' WHERE idPoltronas = 103;
UPDATE Poltronas SET ultima_limpa = '2024-11-16' WHERE idPoltronas = 104;
UPDATE Poltronas SET ultima_limpa = '2024-11-16' WHERE idPoltronas = 105;

 -- -- Converção de dados na tabela Cliente
 UPDATE Cliente -- Insere o email de todos os clientes ja existentes na tabela Cliente
SET email = CASE
                WHEN CPF = '03337246826' THEN 'isabela@hotmail.com'
                WHEN CPF = '19861462864' THEN 'marialuiza@gmail.com'
                WHEN CPF = '86807331800' THEN 'mariana@outlook.com'
                WHEN CPF = '97221101876' THEN 'marina@gmail.com'
                WHEN CPF = '38515127822' THEN 'mariafernanda@gmail.com'
            END
WHERE CPF IN ('03337246826', '19861462864', '86807331800', '97221101876', '38515127822');

-- Consultas envolvendo apenas uma tabela
-- Consulta da tabela Filmes
SELECT * FROM Filme WHERE class_etaria = '14 anos'; -- Seleção de todos os filmes com classificação etária '14 anos'

-- Consulta da tabela Genero
SELECT * FROM Genero WHERE nome != 'Terror'; -- Seleção de todos os Generos om nome diferente de Terror

-- Consulta da tabela sessoes
 SELECT * FROM sessoes
WHERE data_hora > '2024-11-13 16:00:00'; -- Seleção das sessoes que tem data_hora menor que '2024-11-13 16:00:00'

-- Consulta da tabela Sala
SELECT * FROM Sala -- Selecionando todas as informações da Sala com número 103
WHERE n_sala = 103;

-- Consulta da tabela Poltronas
SELECT * FROM Poltronas -- Consulta para verificar poltronas ocupadas
WHERE ocupada = TRUE;

-- Consulta da tabela Cliente
SELECT * -- SELECT que mostra todos os clientes nascidos após 2005
FROM Cliente
WHERE dt_nasc > '2005-12-31';

-- Consultas envolvendo no mínimo duas tabelas
-- Consulta da tabela Filmes
SELECT f.nome, s.data_hora -- Nome dos filmes e suas respectivas sessões
FROM Filme f
JOIN Sessoes s ON f.cod_filme = s.cod_filme;

-- Consulta da tabela Genero
-- Consulta para listar os filmes e seus respectivos gêneros
SELECT f.nome, g.nome AS genero  -- Seleciona o nome do filme e a data e hora da sessão
FROM Filme f 
JOIN Genero g ON f.cod_filme = g.idgenero; -- Faz o JOIN com a tabela Sessoes, relacionando filmes às sessões com base no código do filme

-- Consulta da tabela sessoes
-- Consulta para listar as sessões de filmes, incluindo detalhes da sessão
SELECT 
    S.id_sessao, -- Seleciona o identificador da sessão
    S.data_hora AS sessao_data_hora, -- Seleciona a data e hora da sessão e renomeia a coluna como 'sessao_data_hora'
    F.nome AS filme_nome,  -- Seleciona o nome do filme e renomeia a coluna como 'filme_nome'
    F.class_etaria AS filme_class_etaria -- Seleciona a classificação etária do filme
FROM 
    Sessoes S
JOIN 
    Filme F ON S.cod_filme = F.cod_filme; -- Faz o JOIN com a tabela Filme, relacionando sessões com filmes com base no código do filme

-- Consulta da tabela Sala
-- Selecionando clientes nascidos entre 2005 e 2006 e que estão em salas com capacidade menor que 100
SELECT C.CPF, C.Nome, S.idsala, S.n_sala  -- Seleciona o CPF, nome do cliente, o identificador da sala e o número da sala
FROM Sala S
JOIN Cliente C ON C.dt_nasc BETWEEN '2005-01-01' AND '2006-12-31'   -- Faz o JOIN com a tabela Cliente, filtrando clientes nascidos entre 2005 e 2006
WHERE S.capacidade < 100; -- Filtra salas com capacidade inferior a 100

-- Consulta da tabela Poltronas
-- Consulta para listar os detalhes das poltronas em cada sala
SELECT 
    Sal.n_sala AS numero_sala,  -- Seleciona o número da sala e renomeia a coluna como 'numero_sala'
    Sal.capacidade AS capacidade_sala, -- Seleciona a capacidade da sala e renomeia a coluna como 'capacidade_sala'
    P.numero AS poltrona_numero, -- Seleciona o número da poltrona e renomeia a coluna como 'poltrona_numero'
    P.fileira AS poltrona_fileira, -- Seleciona a fileira da poltrona e renomeia a coluna como 'poltrona_fileira'
    P.tipo AS poltrona_tipo -- Seleciona o tipo da poltrona (Normal, VIP, etc.) e renomeia a coluna como 'poltrona_tipo'
FROM 
    Sala Sal
JOIN 
    Poltronas P ON Sal.idsala = P.idsala; -- Faz o JOIN com a tabela Poltronas, relacionando as poltronas com as salas com base no id da sala

-- Consulta da tabela Cliente
-- Consulta para listar os clientes que estão ocupando poltronas (poltronas ocupadas)
SELECT 
    P.numero AS poltrona_numero,  -- Seleciona o número da poltrona
    P.fileira AS poltrona_fileira, -- Seleciona a fileira da poltrona
    P.tipo AS poltrona_tipo, -- Seleciona o tipo de poltrona
    C.CPF AS cliente_CPF, -- Seleciona o CPF do cliente
    C.Nome AS cliente_nome, -- Seleciona o nome do cliente
    C.dt_nasc AS cliente_data_nasc -- Seleciona a data de nascimento do cliente
FROM 
    Poltronas P
LEFT JOIN 
    Cliente C ON P.ocupada = TRUE; -- Faz um LEFT JOIN com a tabela Cliente, relacionando poltronas ocupadas aos clientes. O LEFT JOIN é usado para incluir todas as poltronas, mesmo que não estejam ocupadas.

-- Criação de uma função
-- Criando de uma função para obter o código do filme com o maior número de sessões
DELIMITER $$
CREATE FUNCTION FilmeComMaisSessoes() -- Define a função chamada 'FilmeComMaisSessoes'
RETURNS INT -- Define que a função retorna um valor do tipo inteiro
DETERMINISTIC -- Especifica que a função sempre retorna o mesmo valor para os mesmos parâmetros de entrada
BEGIN
    DECLARE cod_filme INT; -- Declara uma variável 'cod_filme' do tipo inteiro para armazenar o código do filme com mais sessões

    -- Seleciona o código do filme com o maior número de sessões
    SELECT filme_cod INTO cod_filme -- Busca o código do filme com o maior número de sessões
    FROM sessoes -- Seleciona os registros da tabela sessoes
    GROUP BY filme_cod -- Agrupa os registros por código do filme
    ORDER BY COUNT(*) DESC -- Ordena os resultados pelo número de sessões em ordem decrescente
    LIMIT 1; -- Limita o resultado para apenas o filme com o maior número de sessões

    -- Retorna o código do filme com mais sessões
    RETURN cod_filme;
END$$ -- Finaliza a definição da função
DELIMITER ;  -- Retorna o delimitador padrão ';'

-- Criação de um procedimento armazenado para inserir um cliente
DELIMITER $$

CREATE PROCEDURE inserir_cliente(IN p_CPF VARCHAR(11), IN p_Nome VARCHAR(50), IN p_dt_nasc DATE, IN p_email VARCHAR(100)) -- Define um procedimento chamado 'inserir_cliente', que recebe parâmetros de CPF, nome, data de nascimento e email
BEGIN
	-- Insere um novo cliente na tabela Cliente
    INSERT INTO Cliente (CPF, Nome, dt_nasc, email) 
    VALUES (p_CPF, p_Nome, p_dt_nasc, p_email); 
END $$

DELIMITER ;

-- Execução da procedure
CALL inserir_cliente('87456296753', 'Vinicius', '2005-07-06', 'vinicius@outlook.com'); -- Chamada do Procedure

-- Criação de um gatilho(Trigger)
-- Criando o trigger "Verificar_Duplicidade_CPF" para evitar duplicação de CPF
DELIMITER //

CREATE TRIGGER Verificar_Duplicidade_CPF -- Define o gatilho chamado 'Verificar_Duplicidade_CPF'
BEFORE INSERT ON Cliente -- Define que o gatilho será executado antes de inserir um novo registro na tabela Cliente
FOR EACH ROW -- Especifica que o gatilho será executado para cada nova linha inserida
BEGIN
  -- Verificar se o CPF já existe na tabela Cliente
  IF EXISTS (SELECT 1 FROM Cliente WHERE CPF = NEW.CPF) THEN
    -- Caso o CPF já exista, gera um erro com a mensagem especificada
    SIGNAL SQLSTATE '45000' -- Gera um erro com o código de estado '45000'
    SET MESSAGE_TEXT = 'Erro: CPF já cadastrado.';
  END IF;
END //

-- Retornando o delimitador padrão
DELIMITER ;

-- Deleção das tabelas
DROP TABLE IF EXISTS Poltronas; -- Deleta a tabela Poltronas se ela existir
DROP TABLE IF EXISTS Sala; -- Deleta a tabela Sala se ela existir
DROP TABLE IF EXISTS Sessoes; -- Deleta a tabela Sessoes se ela existir
DROP TABLE IF EXISTS Genero; -- Deleta a tabela Genero se ela existir
DROP TABLE IF EXISTS Filme; -- Deleta a tabela Filme se ela existir
DROP TABLE IF EXISTS Cliente; -- Deleta a tabela Cliente se ela existir

-- Deleção do banco de dados
DROP DATABASE IF EXISTS ProdutoFinal; -- Deleta o banco de dados 'ProdutoFinal' se ele existir