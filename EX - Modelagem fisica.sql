CREATE TABLE restaurantes (
	id INT PRIMARY KEY,
	nome_restaurante VARCHAR(256) NOT NULL,
	rua VARCHAR(256) NOT NULL,
	bairro VARCHAR(256) NOT NULL,
	cidade VARCHAR(256) NOT NULL,
	estado VARCHAR(256) NOT NULL,
	cep VARCHAR(20) NOT NULL,
	telefone VARCHAR(40) NOT NULL,
	tipo_cozinha VARCHAR(256) 
);

CREATE TABLE funcionarios (
	id INT PRIMARY KEY,
	nome VARCHAR(256) NOT NULL,
	funcao VARCHAR(256) NOT NULL,
	telefone VARCHAR(40) NOT NULL,
	email VARCHAR(256) UNIQUE,
	id_restaurante INT NOT NULL,
	FOREIGN KEY (id_restaurante) REFERENCES restaurantes(id)
);

CREATE TABLE mesas (
	id INT PRIMARY KEY,
	numero_mesa INT NOT NULL,
	capacidade INT,
	localizacao_mesa VARCHAR(256),
	disponibilidade VARCHAR(256),
	id_restaurante INT NOT NULL,
	FOREIGN KEY (id_restaurante) REFERENCES restaurantes(id)
);

CREATE TABLE clientes (
	id INT PRIMARY KEY,
	nome VARCHAR(256) NOT NULL,
	telefone VARCHAR(20) NOT NULL,
	email VARCHAR(256) UNIQUE,
);

CREATE TABLE reservas (
	id INT PRIMARY KEY,
	data DATE NOT NULL,
	numero_pessoas INT,
	status_reserva VARCHAR(256),
	id_cliente INT NOT NULL,
	id_restaurante INT NOT NULL,
	id_mesa INT NOT NULL,
	FOREIGN KEY (id_cliente) REFERENCES clientes(id),
	FOREIGN KEY (id_restaurante) REFERENCES restaurantes(id),
	FOREIGN KEY (id_mesa) REFERENCES mesas(id)
);

CREATE TABLE avaliacoes (
	id INT PRIMARY KEY,
	avaliacao INT NOT NULL,
	comentario TEXT,
	data_visita DATE,
	id_cliente INT NOT NULL,
	id_restaurante INT NOT NULL,
	FOREIGN KEY (id_cliente) REFERENCES clientes(id),
	FOREIGN KEY (id_restaurante) REFERENCES restaurantes(id)
);
