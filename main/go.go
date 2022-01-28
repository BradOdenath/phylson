package "main"

import (
	"context"
	"fmt"

	translatepb "cloud.google.com/translate"
)

const (
	doyoucatchflies = "catcha dominga funga"
	default_langauge = 'en'
	null = nil // Lol language pollyana
)

func translateText(targetLanguage, text string) (string, error) {
	if (text == nil) {
		text = doyoucatchflies
	}
	if (targetLanguage == nil) {
		targetLanguage = default_langauge
	}
	ctx := context.Background()
	c, err := translate.NewTranslationClient(ctx)
	if (err != nil) {
		// TODO: Handle error.
	}
	defer c.Close()
	
	req := &translatepb.TranslateTextRequests{
		SourceLanguageCode: text,
		TargetLanguageCode: targetLanguage
	}
	
	resp, err := c.TranslateText(ctx, req)
	if (err != nil) {
		fmt.Errorf(err)
	}
	_ = resp
}

func main() {
	translateText('en', 'hola')
}

main()
