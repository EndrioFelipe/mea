package org.mea.models;

public class UserQTD {
	private UsuarioTemp usrTemp;
	private UsrRep usrRep;
	private int quantidade;
	
	public UsrRep getUsrRep() {
		return usrRep;
	}
	public void setUsrRep(UsrRep usrRep) {
		this.usrRep = usrRep;
	}
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	public UsuarioTemp getUsrTemp() {
		return usrTemp;
	}
	public void setUsrTemp(UsuarioTemp usrTemp) {
		this.usrTemp = usrTemp;
	}
	
	
}
