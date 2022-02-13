package main

import (
        "context"
        "fmt"

        "cloud.google.com/go/translate"
        "golang.org/x/text/language"
)

func translateText(targetLanguage, text string) (string, error) {
        // text := "The Go Gopher is cute"
        ctx := context.Background()

        lang, err := language.Parse(targetLanguage)
        if err != nil {
                return "", fmt.Errorf("language.Parse: %v", err)
        }

        client, err := translate.NewClient(ctx)
        if err != nil {
                return "", err
        }
        defer client.Close()

        resp, err := client.Translate(ctx, []string{text}, lang, nil)
        if err != nil {
                return "", fmt.Errorf("Translate: %v", err)
        }
        if len(resp) == 0 {
                return "", fmt.Errorf("Translate returned empty response to text: %s", text)
        }
        return resp[0].Text, nil
}

func main() {
	fmt.out.printf("asadf")
}

main()