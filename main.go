package main

import (
	"fmt"
	"log"

	"gopkg.in/yaml.v3"
)

func main() {
	bts, err := yaml.Marshal(struct {
		Name string
		Age  int
	}{
		Name: "John",
		Age:  30,
	})
	if err != nil {
		log.Fatalln(err)
	}
	fmt.Printf("\nyaml:\n\n%s\n", bts)
}
