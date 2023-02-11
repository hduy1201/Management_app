package apis

import (
	"net/http"

	"github.com/labstack/echo/v4"
	"itss.edu.com.vn/management_apis/core"
)

func NewHealthyAPI(endpoints string, server *core.Server) *echo.Group {
	apis := server.Echo.Group(endpoints)

	apis.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "OK")
	})

	return apis
}
