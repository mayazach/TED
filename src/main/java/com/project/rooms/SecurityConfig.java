package com.project.rooms;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	private MyUserDetailsService userDetailsService;
	@Autowired
	private CustomSuccessHandler customSuccessHandler;
	
	@Override
    protected void configure(HttpSecurity http) throws Exception {
        http
        	.requiresChannel()
        		.and()
            .authorizeRequests()
                .antMatchers("/", "/search","/showroom/**","/index3.html","/register","index.html","/logged","/usernameExists/**").permitAll()
                .antMatchers("/adminpanel").hasAuthority("admin")
                .antMatchers("/managerooms","/addroom","/newroom").hasAuthority("owner")
                .anyRequest().authenticated()
                .and()
            .formLogin()
                .loginPage("/login")
                .permitAll()
                .successHandler(customSuccessHandler)
                .and()
            .logout()
                .permitAll()
                .logoutSuccessUrl("/index.html").permitAll()
        		.and()
        	.csrf().disable();
    }
	
	@Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/css/**", "/js/**", "/img/**", "/fonts/**","/jsp/**");
    }
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth)
	  throws Exception {
	    auth.authenticationProvider(authenticationProvider());
	}

	public DaoAuthenticationProvider authenticationProvider() {
	    DaoAuthenticationProvider authProvider
	      = new DaoAuthenticationProvider();
	    authProvider.setUserDetailsService(userDetailsService);
	    return authProvider;
	}

}
