package main

import (
	"context"
	_ "embed"
	"fmt"
	"os"
	"strings"

	"github.com/sashabaranov/go-openai"
)

//go:embed rules
var migrationRules string

const key = "..."

func main() {
	codeFile := os.Args[1]
	data, err := os.ReadFile(codeFile)
	code := fmt.Sprintf(`Migrate the following code to Cadence 1.0 according with all the provided rules: """%s"""`, data)

	client := openai.NewClient(key)

	resp, err := client.CreateChatCompletion(context.Background(), openai.ChatCompletionRequest{
		Model: openai.GPT4,
		Messages: []openai.ChatCompletionMessage{{
			Role:    openai.ChatMessageRoleSystem,
			Content: migrationRules,
		}, {
			Role:    openai.ChatMessageRoleUser,
			Content: code,
		}},
	})
	if err != nil {
		fmt.Printf("Completion error: %v\n", err)
		return
	}

	migratedFile := fmt.Sprintf("migrated-%s", codeFile)
	migratedCode := strings.ReplaceAll(resp.Choices[0].Message.Content, `"""`, "")

	err = os.WriteFile(migratedFile, []byte(migratedCode), 0677)
	if err != nil {
		panic(err)
	}

	fmt.Printf("\n🎉 Migrated code and written to %s", migratedFile)
}
