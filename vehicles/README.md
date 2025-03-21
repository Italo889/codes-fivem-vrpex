# Vehicle Scripts for vRPex

Este repositório contém scripts de veículos para uso em servidores FiveM baseados no framework vRPex. Siga as instruções abaixo para configurar e utilizar os scripts corretamente.

## Pré-requisitos

- Servidor FiveM configurado.
- Base vRPex instalada e funcional.
- Conhecimento básico em Lua e configuração de scripts.

## Instalação

1. **Baixe os arquivos**: Certifique-se de que os scripts estão na pasta correta (`/vehicles`).
2. **Adicione os scripts ao seu `resources`**:
    - Copie a pasta do script para a pasta `resources` do seu servidor.
3. **Edite o arquivo `server.cfg`**:
    - Adicione a linha abaixo no seu `server.cfg`:
      ```cfg
      ensure vehicles
      ```

## Uso

- **Comandos**:
  - Exemplos de comandos disponíveis:
     ```
     /car [modelo] - Spawna um veículo específico. **Apenas com permissão 
     /reparar - Repara o veículo atual. **Apenas com permissão 
     /dv - Deleta o veículo atual ou o mais próximo  **Apenas com permissão 
     ```

- **Eventos**:
  - O script pode disparar eventos personalizados. Consulte o código para verificar os eventos disponíveis e como utilizá-los.

## Suporte

Se encontrar problemas ou tiver dúvidas, abra uma issue neste repositório ou entre em contato com a comunidade vRPex.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).