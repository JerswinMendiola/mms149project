extends TextureButton

func showPassword() -> void:
	get_parent().secret = !get_parent().secret
