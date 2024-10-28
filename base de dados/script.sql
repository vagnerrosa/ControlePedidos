

CREATE TABLE clientes (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(60),
    uf CHAR(2),
    INDEX idx_cliente (nome)
);

CREATE TABLE produtos (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    preco_venda DECIMAL(10, 2) NOT NULL,
    INDEX idx_descricao (descricao)
);

INSERT INTO clientes (nome, cidade, uf) VALUES 
('João Silva', 'São Paulo', 'SP'),
('Maria Oliveira', 'Rio de Janeiro', 'RJ'),
('Carlos Souza', 'Belo Horizonte', 'MG'),
('Ana Santos', 'Curitiba', 'PR'),
('Lucas Lima', 'Salvador', 'BA'),
('Fernanda Pereira', 'Porto Alegre', 'RS'),
('Rafael Costa', 'Brasília', 'DF'),
('Patrícia Almeida', 'Fortaleza', 'CE'),
('Eduardo Rocha', 'Recife', 'PE'),
('Juliana Martins', 'Manaus', 'AM'),
('Roberto Mendes', 'Goiânia', 'GO'),
('Camila Nascimento', 'Natal', 'RN'),
('Marcos Fernandes', 'Florianópolis', 'SC'),
('Tatiane Dias', 'Campo Grande', 'MS'),
('Felipe Gomes', 'São Luís', 'MA'),
('Juliano Barros', 'Teresina', 'PI'),
('Larissa Cardoso', 'João Pessoa', 'PB'),
('Tiago Moreira', 'Maceió', 'AL'),
('Sérgio Ribeiro', 'Aracaju', 'SE'),
('Aline Silva', 'Belém', 'PA'),
('Gustavo Martins', 'Vitória', 'ES'),
('Jéssica Lima', 'Cuiabá', 'MT'),
('André Santos', 'Rio Branco', 'AC'),
('Simone Nunes', 'Boa Vista', 'RR'),
('Vitor Hugo', 'Palmas', 'TO'),
('Mariana Tavares', 'Macapá', 'AP');

INSERT INTO produtos (descricao, preco_venda) VALUES 
('Produto A', 10.00),
('Produto B', 15.50),
('Produto C', 8.75),
('Produto D', 22.99),
('Produto E', 5.99),
('Produto F', 12.49),
('Produto G', 19.90),
('Produto H', 30.00),
('Produto I', 45.50),
('Produto J', 2.50),
('Produto K', 99.99),
('Produto L', 33.33),
('Produto M', 27.89),
('Produto N', 18.20),
('Produto O', 7.40),
('Produto P', 11.15),
('Produto Q', 13.99),
('Produto R', 4.99),
('Produto S', 20.00),
('Produto T', 35.75),
('Produto U', 16.80),
('Produto V', 14.25),
('Produto W', 9.90),
('Produto X', 3.50),
('Produto Y', 28.60),
('Produto Z', 23.45);


CREATE TABLE pedidos (
    numero_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_emissao DATE NOT NULL,
    codigo_cliente INT NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (codigo_cliente) REFERENCES clientes(codigo) ON DELETE CASCADE,
    INDEX idx_codigo_cliente (codigo_cliente)
);

CREATE TABLE pedidos_produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero_pedido INT NOT NULL,
    codigo_produto INT NOT NULL,
    quantidade INT NOT NULL,
    vir_unitario DECIMAL(10, 2) NOT NULL,
    vir_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (numero_pedido) REFERENCES pedidos(numero_pedido) ON DELETE CASCADE,
    FOREIGN KEY (codigo_produto) REFERENCES produtos(codigo) ON DELETE CASCADE,
    INDEX idx_numero_pedido (numero_pedido),
    INDEX idx_codigo_produto (codigo_produto)
);




INSERT INTO pedidos (data_emissao, codigo_cliente, valor_total) VALUES 
('2024-01-01', 1, 150.00),
('2024-01-02', 2, 200.50),
('2024-01-03', 3, 100.75),
('2024-01-04', 4, 300.20),
('2024-01-05', 5, 250.00),
('2024-01-06', 6, 90.99),
('2024-01-07', 7, 120.00),
('2024-01-08', 8, 75.50),
('2024-01-09', 9, 180.00),
('2024-01-10', 10, 55.25),
('2024-01-11', 11, 130.40),
('2024-01-12', 12, 300.75),
('2024-01-13', 13, 80.00),
('2024-01-14', 14, 110.25),
('2024-01-15', 15, 140.00),
('2024-01-16', 16, 170.60),
('2024-01-17', 17, 95.90),
('2024-01-18', 18, 120.80),
('2024-01-19', 19, 210.00),
('2024-01-20', 20, 75.00),
('2024-01-21', 21, 190.50),
('2024-01-22', 22, 160.00),
('2024-01-23', 23, 220.00),
('2024-01-24', 24, 135.00),
('2024-01-25', 25, 300.00);


INSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(1, 1, 2, 10.00, 20.00),
(1, 2, 1, 15.50, 15.50),
(1, 3, 3, 8.75, 26.25),
(1, 4, 1, 22.99, 22.99),
(1, 5, 5, 5.99, 29.95),
(1, 6, 4, 12.49, 49.96),
(1, 7, 2, 19.90, 39.80),
(1, 8, 1, 30.00, 30.00),
(1, 9, 2, 45.50, 91.00),
(1, 10, 1, 2.50, 2.50);

INSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(2, 1, 1, 10.00, 10.00),
(2, 2, 2, 15.50, 31.00),
(2, 3, 1, 8.75, 8.75),
(2, 4, 1, 22.99, 22.99),
(2, 5, 2, 5.99, 11.98),
(2, 6, 3, 12.49, 37.47),
(2, 7, 1, 19.90, 19.90),
(2, 8, 2, 30.00, 60.00),
(2, 9, 1, 45.50, 45.50),
(2, 10, 2, 2.50, 5.00);

INSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(3, 1, 3, 10.00, 30.00),
(3, 2, 1, 15.50, 15.50),
(3, 3, 2, 8.75, 17.50),
(3, 4, 2, 22.99, 45.98),
(3, 5, 1, 5.99, 5.99),
(3, 6, 3, 12.49, 37.47),
(3, 7, 1, 19.90, 19.90),
(3, 8, 2, 30.00, 60.00),
(3, 9, 1, 45.50, 45.50),
(3, 10, 1, 2.50, 2.50);

INSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(4, 1, 1, 10.00, 10.00),
(4, 2, 2, 15.50, 31.00),
(4, 3, 1, 8.75, 8.75),
(4, 4, 1, 22.99, 22.99),
(4, 5, 2, 5.99, 11.98),
(4, 6, 3, 12.49, 37.47),
(4, 7, 1, 19.90, 19.90),
(4, 8, 2, 30.00, 60.00),
(4, 9, 1, 45.50, 45.50),
(4, 10, 2, 2.50, 5.00);


NSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(5, 1, 2, 10.00, 20.00),
(5, 2, 1, 15.50, 15.50),
(5, 3, 3, 8.75, 26.25),
(5, 4, 1, 22.99, 22.99),
(5, 5, 5, 5.99, 29.95),
(5, 6, 4, 12.49, 49.96),
(5, 7, 2, 19.90, 39.80),
(5, 8, 1, 30.00, 30.00),
(5, 9, 2, 45.50, 91.00),
(5, 10, 1, 2.50, 2.50);


INSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(6, 1, 2, 10.00, 20.00),
(6, 2, 1, 15.50, 15.50),
(6, 3, 3, 8.75, 26.25),
(6, 4, 1, 22.99, 22.99),
(6, 5, 5, 5.99, 29.95),
(6, 6, 4, 12.49, 49.96),
(6, 7, 2, 19.90, 39.80),
(6, 8, 1, 30.00, 30.00),
(6, 9, 2, 45.50, 91.00),
(6,10, 1, 2.50, 2.50);

INSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(7, 1, 1, 10.00, 10.00),
(7, 2, 2, 15.50, 31.00),
(7, 3, 1, 8.75, 8.75),
(7, 4, 1, 22.99, 22.99),
(7, 5, 2, 5.99, 11.98),
(7, 6, 3, 12.49, 37.47),
(7, 7, 1, 19.90, 19.90),
(7, 8, 2, 30.00, 60.00),
(7, 9, 1, 45.50, 45.50),
(7, 10, 2, 2.50, 5.00);

INSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(8, 1, 3, 10.00, 30.00),
(8, 2, 1, 15.50, 15.50),
(8, 3, 2, 8.75, 17.50),
(8, 4, 2, 22.99, 45.98),
(8, 5, 1, 5.99, 5.99),
(8, 6, 3, 12.49, 37.47),
(8, 7, 1, 19.90, 19.90),
(8, 8, 2, 30.00, 60.00),
(8, 9, 1, 45.50, 45.50),
(8, 10, 1, 2.50, 2.50);

INSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(9, 1, 1, 10.00, 10.00),
(9, 2, 2, 15.50, 31.00),
(9, 3, 1, 8.75, 8.75),
(9, 4, 1, 22.99, 22.99),
(9, 5, 2, 5.99, 11.98),
(9, 6, 3, 12.49, 37.47),
(9, 7, 1, 19.90, 19.90),
(9, 8, 2, 30.00, 60.00),
(9, 9, 1, 45.50, 45.50),
(9, 10, 2, 2.50, 5.00);


NSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(10,1, 2, 10.00, 20.00),
(10, 2, 1, 15.50, 15.50),
(10, 3, 3, 8.75, 26.25),
(10, 4, 1, 22.99, 22.99),
(10, 5, 5, 5.99, 29.95),
(10, 6, 4, 12.49, 49.96),
(10, 7, 2, 19.90, 39.80),
(10, 8, 1, 30.00, 30.00),
(10, 9, 2, 45.50, 91.00),
(10, 10, 1, 2.50, 2.50);

//////////////////////////////

INSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(11, 1, 2, 10.00, 20.00),
(11, 2, 1, 15.50, 15.50),
(11, 3, 3, 8.75, 26.25),
(11, 4, 1, 22.99, 22.99),
(11, 5, 5, 5.99, 29.95),
(11, 6, 4, 12.49, 49.96),
(11, 7, 2, 19.90, 39.80),
(11, 8, 1, 30.00, 30.00),
(11, 9, 2, 45.50, 91.00),
(11, 10, 1, 2.50, 2.50);

INSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(12, 1, 1, 10.00, 10.00),
(12, 2, 2, 15.50, 31.00),
(12, 3, 1, 8.75, 8.75),
(12, 4, 1, 22.99, 22.99),
(12, 5, 2, 5.99, 11.98),
(12, 6, 3, 12.49, 37.47),
(12, 7, 1, 19.90, 19.90),
(12, 8, 2, 30.00, 60.00),
(12, 9, 1, 45.50, 45.50),
(12, 10, 2, 2.50, 5.00);

INSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(13, 1, 3, 10.00, 30.00),
(13, 2, 1, 15.50, 15.50),
(13, 3, 2, 8.75, 17.50),
(13, 4, 2, 22.99, 45.98),
(13, 5, 1, 5.99, 5.99),
(13, 6, 3, 12.49, 37.47),
(13, 7, 1, 19.90, 19.90),
(13, 8, 2, 30.00, 60.00),
(13, 9, 1, 45.50, 45.50),
(13, 10, 1, 2.50, 2.50);

INSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(14, 1, 1, 10.00, 10.00),
(14, 2, 2, 15.50, 31.00),
(14, 3, 1, 8.75, 8.75),
(14, 4, 1, 22.99, 22.99),
(14, 5, 2, 5.99, 11.98),
(14, 6, 3, 12.49, 37.47),
(14, 7, 1, 19.90, 19.90),
(14, 8, 2, 30.00, 60.00),
(14, 9, 1, 45.50, 45.50),
(14, 10, 2, 2.50, 5.00);


NSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(15, 1, 2, 10.00, 20.00),
(15, 2, 1, 15.50, 15.50),
(15, 3, 3, 8.75, 26.25),
(15, 4, 1, 22.99, 22.99),
(15, 5, 5, 5.99, 29.95),
(15, 6, 4, 12.49, 49.96),
(15, 7, 2, 19.90, 39.80),
(15, 8, 1, 30.00, 30.00),
(15, 9, 2, 45.50, 91.00),
(15, 10, 1, 2.50, 2.50);


INSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(16, 1, 2, 10.00, 20.00),
(16, 2, 1, 15.50, 15.50),
(16, 3, 3, 8.75, 26.25),
(16, 4, 1, 22.99, 22.99),
(16, 5, 5, 5.99, 29.95),
(16, 6, 4, 12.49, 49.96),
(16, 7, 2, 19.90, 39.80),
(16, 8, 1, 30.00, 30.00),
(16, 9, 2, 45.50, 91.00),
(16,10, 1, 2.50, 2.50);

INSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(17, 1, 1, 10.00, 10.00),
(17, 2, 2, 15.50, 31.00),
(17, 3, 1, 8.75, 8.75),
(17, 4, 1, 22.99, 22.99),
(17, 5, 2, 5.99, 11.98),
(17, 6, 3, 12.49, 37.47),
(17, 7, 1, 19.90, 19.90),
(17, 8, 2, 30.00, 60.00),
(17, 9, 1, 45.50, 45.50),
(17, 10, 2, 2.50, 5.00);

INSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(18, 1, 3, 10.00, 30.00),
(18, 2, 1, 15.50, 15.50),
(18, 3, 2, 8.75, 17.50),
(18, 4, 2, 22.99, 45.98),
(18, 5, 1, 5.99, 5.99),
(18, 6, 3, 12.49, 37.47),
(18, 7, 1, 19.90, 19.90),
(18, 8, 2, 30.00, 60.00),
(18, 9, 1, 45.50, 45.50),
(18, 10, 1, 2.50, 2.50);

INSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(19, 1, 1, 10.00, 10.00),
(19, 2, 2, 15.50, 31.00),
(19, 3, 1, 8.75, 8.75),
(19, 4, 1, 22.99, 22.99),
(19, 5, 2, 5.99, 11.98),
(19, 6, 3, 12.49, 37.47),
(19, 7, 1, 19.90, 19.90),
(19, 8, 2, 30.00, 60.00),
(19, 9, 1, 45.50, 45.50),
(19, 10, 2, 2.50, 5.00);


NSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(20,1, 2, 10.00, 20.00),
(20, 2, 1, 15.50, 15.50),
(20, 3, 3, 8.75, 26.25),
(20, 4, 1, 22.99, 22.99),
(20, 5, 5, 5.99, 29.95),
(20, 6, 4, 12.49, 49.96),
(20, 7, 2, 19.90, 39.80),
(20, 8, 1, 30.00, 30.00),
(20, 9, 2, 45.50, 91.00),
(20, 10, 1, 2.50, 2.50);



NSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(20,1, 2, 10.00, 20.00),
(20, 2, 1, 15.50, 15.50),
(20, 3, 3, 8.75, 26.25),
(20, 4, 1, 22.99, 22.99),
(20, 5, 5, 5.99, 29.95),
(20, 6, 4, 12.49, 49.96),
(20, 7, 2, 19.90, 39.80),
(20, 8, 1, 30.00, 30.00),
(20, 9, 2, 45.50, 91.00),
(20, 10, 1, 2.50, 2.50);


NSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(20,1, 2, 10.00, 20.00),
(20, 2, 1, 15.50, 15.50),
(20, 3, 3, 8.75, 26.25),
(20, 4, 1, 22.99, 22.99),
(20, 5, 5, 5.99, 29.95),
(20, 6, 4, 12.49, 49.96),
(20, 7, 2, 19.90, 39.80),
(20, 8, 1, 30.00, 30.00),
(20, 9, 2, 45.50, 91.00),
(20, 10, 1, 2.50, 2.50);


NSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(21,1, 2, 10.00, 20.00),
(21, 2, 1, 15.50, 15.50),
(21, 3, 3, 8.75, 26.25),
(21, 4, 1, 22.99, 22.99),
(21, 5, 5, 5.99, 29.95),
(21, 6, 4, 12.49, 49.96),
(21, 7, 2, 19.90, 39.80),
(21, 8, 1, 30.00, 30.00),
(21, 9, 2, 45.50, 91.00),
(21, 10, 1, 2.50, 2.50);


NSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(22,1, 2, 10.00, 20.00),
(22, 2, 1, 15.50, 15.50),
(22, 3, 3, 8.75, 26.25),
(22, 4, 1, 22.99, 22.99),
(22, 5, 5, 5.99, 29.95),
(22, 6, 4, 12.49, 49.96),
(22, 7, 2, 19.90, 39.80),
(22, 8, 1, 30.00, 30.00),
(22, 9, 2, 45.50, 91.00),
(22, 10, 1, 2.50, 2.50);


NSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(23,1, 2, 10.00, 20.00),
(23, 2, 1, 15.50, 15.50),
(23, 3, 3, 8.75, 26.25),
(23, 4, 1, 22.99, 22.99),
(23, 5, 5, 5.99, 29.95),
(23, 6, 4, 12.49, 49.96),
(23, 7, 2, 19.90, 39.80),
(23, 8, 1, 30.00, 30.00),
(23, 9, 2, 45.50, 91.00),
(23, 10, 1, 2.50, 2.50);


NSERT INTO pedidos_produtos (numero_pedido, codigo_produto, quantidade, vir_unitario, vir_total) VALUES 
(24,1, 2, 10.00, 20.00),
(24, 2, 1, 15.50, 15.50),
(24, 3, 3, 8.75, 26.25),
(24, 4, 1, 22.99, 22.99),
(24, 5, 5, 5.99, 29.95),
(25, 6, 4, 12.49, 49.96),
(25, 7, 2, 19.90, 39.80),
(25, 8, 1, 30.00, 30.00),
(25, 9, 2, 45.50, 91.00),
(25, 10, 1, 2.50, 2.50);