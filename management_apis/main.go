package main

import (
	"itss.edu.com.vn/management_apis/apis"
	"itss.edu.com.vn/management_apis/core"
)

func main() {

	server := core.NewServer()

	_ = apis.NewHealthyAPI("/healthy", server)
	server.Start()
}
