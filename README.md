![Screenshot 2024-01-09 at 17 50 54](https://github.com/onflow/cadence-1-migrator/assets/75445744/d6d2874f-f5ce-4d01-b493-3081ff756e49)## Cadence 1.0 Migrator

This is POC tool that uses GPT to migrate Cadence to 1.0 version.

### Running
Create a GPT API key here: https://platform.openai.com/api-keys 

Set the generated key as an environment variable in your terminal and run the tool using Go:
```
GPT_KEY={your generated key} go run main/main.go {contract file}
```

This will output a migrated file.

Example:

```
GPT_KEY=123123 go run main/main.go test.cdc
```

### WARNING
This is WIP! expect issues. There is a limit on the contract input length right now.

## TODO
- [ ] Fix the limit on the contract input, this is due to the prompt input limit, because we use system prompt to provide context, we should use another method for GPT to learn the rules from, I believe assistant can be another tool, this would also make it cheaper. 


### Example
Here's a limited example of diff for migrated Cadence code.
![Screenshot 2024-01-09 at 17 50 54](https://github.com/onflow/cadence-1-migrator/assets/75445744/1cd9d098-d2cd-4a66-9f86-15fb946c820c)
