package main

import (
    "fmt"
    "net/http"
    "log"
    "os"
)

var binding = os.Getenv("BINDING")

func main() {
	if len(binding) == 0 {
        binding = ":8080"
    }

    http.HandleFunc("/", func (w http.ResponseWriter, r *http.Request) { fmt.Fprintf(w, "HelloWorld") }) // set router
    err := http.ListenAndServe(binding, nil) // set listen port
    if err != nil {
        log.Fatal("ListenAndServe: ", err)
    }
}