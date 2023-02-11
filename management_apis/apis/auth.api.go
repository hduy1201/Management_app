package apis

import (
	"github.com/labstack/echo/v4"
	"itss.edu.com.vn/management_apis/core"
)

func NewAuthAPI(endpoints string, server *core.Server) *echo.Group {
	apis := server.Echo.Group(endpoints)

	// apis.POST("/register", func(c echo.Context) error {
	// 	var regUser
	// })

	return apis
}
