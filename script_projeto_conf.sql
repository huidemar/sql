create table cidade(
id   integer constraint pk_cidade primary key,
nome varchar(120) not null,
uf   char(2) not null
);

create table produto(
id    integer constraint pk_produto primary key,
nome  varchar(120),
valor numeric(10,4),
qtde  numeric(10,4)
);

create table pessoa(
id             integer constraint pk_pessoas primary key,
nome           varchar(120) not null,
cpf            varchar(14),
rg             varchar(14),
sexo           char(1) not null,
data_nacimento date,
fone1          varchar(14),
fone2          varchar(14),
fone3          varchar(14),
ramal1         varchar(5),
ramal2         varchar(5),
tppessoa       char(1), --(p)alestrante, (r)
cidade_id      integer constraint fk_pessoa_cidade_id foreign key(cidade_id) references cidade(id)
);

create table evento(
id   integer constraint pk_evento primary key,
nome varchar(12) not null,
logo blob sub_type binary
);

create table evento_realizacao(
id        integer constraint pk_evento_realizacao primary key,
data      date,
evento_id integer constraint fk_evento_realizacao_id foreign key(evento_id) references evento(id)
);

create table pessoa_participa(
id                   integer constraint pk_pessoa_participa primary key,
pessoa_id            integer,
evento_realizacao_id integer
);

create table pessoa_credito(
id        integer constraint pk_pessoa_credito primary key,
pessoa_id integer,
evento_id integer,
valor     numeric(10,4),
tp_dc     char(1),
data_hora timestamp
);

create table movimento(
id           integer constraint pk_movimento primary key
evento_id    integer,
pessoa_id    integer,
valor        numeric(10,4),
tp_movimento char(1), -- Compra ou Crédito
data         timestamp
);

create table movimento_detalhe(
id              integer constraint pk_movimento_detalhe primary key,
movimentacao_id integer,
produto_id      integer,
qtde            numeric(10,4),
valor           numeric(10,4)
);
