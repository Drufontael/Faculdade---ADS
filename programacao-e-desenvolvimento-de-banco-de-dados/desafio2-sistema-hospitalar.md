# Desafio 2

## Sistema Hospitalar

### **Descrição:** 
Você foi designado para modelar o banco de dados de um hospital. O sistema deve controlar os pacientes, médicos, consultas e tratamentos.

- Um paciente pode marcar várias consultas, mas uma consulta pertence a apenas um paciente.
- Cada consulta é realizada por um único médico, mas um médico pode realizar várias consultas.
- Uma consulta pode ter um ou mais tratamentos prescritos, e cada tratamento pode ser prescrito em várias consultas.
- Um paciente pode ter várias internações, e uma internação está associada a apenas um paciente.
  
### **Tarefas**
1. Identifique as principais entidades do sistema hospitalar.
2. Defina os relacionamentos entre essas entidades.
3. Construa um diagrama ER que represente as entidades, atributos e relacionamentos do sistema.

### **Desenvolvmento e Soluções**

1. Identificar as principais entidades:
   
   - Paciente
   - Medico
   - Consulta
   - Tratamento
   - Internacao
  
2. Definir relacionamentos:
   
   - Paciente | 1 ----- Marca ----- 0.* | Consulta
   - Medico | 1 ----- Realiza ----- 0.* | Consulta
   - Consulta | 1 ----- Possui ----- 1.* | Tratamento
   - Tratamento | 1 ----- Prescrito em ----- | Consulta
   - Paciente | 1 ----- Tem ----- 0.* | Internacao
   - Internacao | 1 ----- Tem ----- 0.* | Tratamento
   - Tratamento | 1 ----- Prescrito em ----- 0.* | Internacao

3. Identificar entidades secundarias/apoio:
   - Consulta_Tratamento
   - Internacao_Tratamento
   - Endereco
   - Especialidade
  
4. Diagrama ER:
```mermaid
    erDiagram

    PACIENTE{
        int id PK
        string nome
        string cpf
        date data_nacimento
        enum sexo
        string cep FK
        int numero_residencia
        string complemento
        string telefone
    }

    MEDICO{
        int id PK
        string nome
        int id_especialidade FK
        string crm
        string cep FK
        int numero_residencia
        string complemento
        string telefone    
    }

    CONSULTA{
        int id PK
        date data
        int id_paciente FK
        int id_medico FK
    }

    TRATAMENTO{
        int id PK
        string nome
        string descricao
        int id_especialidade
    }

    CONSULTA_TRATAMENTO{
        int id_consulta FK
        int id_tratamento FK
    }

    INTERNACAO{
        int id PK
        date data_entrada
        date data_saida
        string leito
        int id_paciente FK
    }

    INTERNACAO_TRATAMENTO{
        int id_internacao FK
        int if_tratament FK
    }

    ESPECIALIDADE{
        int id PK
        string nome
        string descricao
    }

    ENDERECO{
        string cep PK
        string logradouro
        string bairro
        string cidade
        string uf
        string pais
    }

    PACIENTE ||--o{ CONSULTA: marca
    PACIENTE }o--|| ENDERECO: possuem
    MEDICO ||--o{ CONSULTA: realiza
    MEDICO }o--|| ENDERECO: possuem
    MEDICO }o--|| ESPECIALIDADE: possuem
    CONSULTA ||--o{ CONSULTA_TRATAMENTO: possui
    TRATAMENTO ||--o{ CONSULTA_TRATAMENTO: prescrito_em
    PACIENTE ||--o{ INTERNACAO: possui
    INTERNACAO ||--o{ INTERNACAO_TRATAMENTO: possui
    TRATAMENTO ||--o{ INTERNACAO_TRATAMENTO: prescrito_em
```
