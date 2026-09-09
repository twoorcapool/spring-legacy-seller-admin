package org.adminsystem.member.dto;

import java.time.LocalDateTime;
import lombok.Data;

@Data
public class UserDTO {
	
	private Long uid;
	private String upw;
    private String uname;
    private String role;
    private String email;
    private String phone;
    private String status;
    private LocalDateTime regDate;
    private LocalDateTime modDate;
    
}
