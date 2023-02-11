package core

import (
	"context"
	"os"

	"github.com/labstack/echo/v4"

	firebase "firebase.google.com/go/v4"
	"firebase.google.com/go/v4/auth"
	"google.golang.org/api/option"
)

type Server struct {
	Echo       *echo.Echo
	Firebase   *firebase.App
	AuthClient *auth.Client
}

func NewServer() *Server {

	opt := option.WithCredentialsFile("./admin-key.json")
	app, err := firebase.NewApp(context.Background(), nil, opt)
	if err != nil {
		panic(err)
	}

	authClient, err := app.Auth(context.Background())
	if err != nil {
		panic(err)
	}

	server := &Server{
		Echo:       echo.New(),
		Firebase:   app,
		AuthClient: authClient,
	}
	return server
}

func (s *Server) Start() error {
	return s.Echo.Start(os.Getenv("HOST"))
}
