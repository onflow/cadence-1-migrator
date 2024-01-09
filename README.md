## Cadence 1.0 Migrator

This is POC tool that uses GPT to migrate Cadence to 1.0 version.

### Running
Create a GPT API key here: https://platform.openai.com/api-keys 

Set the generate key as an environment variable in your terminal:
```
GPT_KEY={your generated key}
```

To run the tool you have to run it using Go like so:

```
go run main/main.go {contract file}
```

This will output a migrated file.

Example:

```
go run main/main.go test.cdc
```

### WARNING
This is WIP! expect issues. There is a limit on the contract input length right now.

## TODO
- [ ] Fix the limit on the contract input, this is due to the prompt input limit, because we use system prompt to provide context, we should use another method for GPT to learn the rules from, I believe assistant can be another tool, this would also make it cheaper. 
