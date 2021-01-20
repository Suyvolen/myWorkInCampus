package shopping.action;

import java.util.List;

import shopping.po.Item;
import shopping.service.IItemService;

public class ItemAction {
	private List items =null;
	private Item item;
	private IItemService itemService=null;
	private String itemname = null;
	
	public List getItems() {
		return items;
	}
	public void setItems(List items) {
		this.items = items;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	
	public IItemService getItemService() {
		return itemService;
	}
	public void setItemService(IItemService itemService) {
		this.itemService = itemService;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public String getAllItems() {
		items = itemService.findAll();
		return "success";
	}
	
	public String itemAdd() {
		if(itemService.add(item)) {
			return "addsuccess";
		}
		return "addfail";
	}
	
	public String itemDelete() {
		if(itemService.delete(item)) {
			return "deletesuccess";
		}
		return "deletefail";
	}
	
	public String itemUpdate() {
		if(itemService.update(item)) {
			return "updatesuccess";
		}
		return "updatefail";
	}
	
	public String itemDetail() {
		return "success";
	}
	
	public String findLikeItem() {
		items = itemService.findLikeItem(itemname);
		return "success";
	}
}
