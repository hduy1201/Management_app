package models

type UserRegisRequest struct {
	Email    string `json:"email" validate:"required,email"`
	Password string `json:"password" validate:"required,min=6,max=50"`
	FullName string `json:"full_name" validate:"required"`
	Roles    string `json:"roles" validate:"required"`
}
